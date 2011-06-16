Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QX3A6-0006Lh-Ac
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 05:22:30 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jun 2011 20:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,372,1304319600"; d="scan'208";a="16853452"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.50])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2011 20:19:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Jun 2011 20:18:59 -0700
Message-Id: <f26a5237b32d742b5f56e30b652a6df747914fb4.1308193566.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308193566.git.sgw@linux.intel.com>
References: <cover.1308193566.git.sgw@linux.intel.com>
In-Reply-To: <cover.1308193566.git.sgw@linux.intel.com>
References: <cover.1308193566.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] gconf-dbus: Fix SRC_URI to tarball
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
X-List-Received-Date: Thu, 16 Jun 2011 03:22:30 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnome/{gconf-dbus_svn.bb => gconf-dbus_705.bb} |   11 ++++++++---
 1 files changed, 8 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gnome/{gconf-dbus_svn.bb => gconf-dbus_705.bb} (69%)

diff --git a/meta/recipes-gnome/gnome/gconf-dbus_svn.bb b/meta/recipes-gnome/gnome/gconf-dbus_705.bb
similarity index 69%
rename from meta/recipes-gnome/gnome/gconf-dbus_svn.bb
rename to meta/recipes-gnome/gnome/gconf-dbus_705.bb
index 16a2ddb..fdfc45f 100644
--- a/meta/recipes-gnome/gnome/gconf-dbus_svn.bb
+++ b/meta/recipes-gnome/gnome/gconf-dbus_705.bb
@@ -8,10 +8,15 @@ PROVIDES = "gconf"
 RPROVIDES_${PN} = "gconf"
 RPROVIDES_${PN}-dev = "gconf-dev"
 
-SRCREV = "705"
-PV = "2.16.0+svnr${SRCPV}"
+#SRCREV = "705"
+#PV = "2.16.0+svnr${SRCPV}"
+PR = "r0"
+
+# This SVN repo is no longer available use a tarball mirror site until
+# we move to proper gconf recipe.
+#SRC_URI = "svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http"
+SRC_URI = "http://autobuilder.pokylinux.org/sources/trunk_developer.imendio.com_.svn.gconf-dbus_705_.tar.gz"
 
-SRC_URI = "svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http"
 S = "${WORKDIR}/trunk"
 
 inherit pkgconfig autotools
-- 
1.7.3.4



