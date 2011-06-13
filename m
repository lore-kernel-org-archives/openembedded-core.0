Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QW164-0002Fx-MP
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 08:58:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 12 Jun 2011 23:54:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,356,1304319600"; d="scan'208";a="17500605"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jun 2011 23:54:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jun 2011 23:54:17 -0700
Message-Id: <e775999792169f5a72a6924d36ef8e07beda684a.1307947593.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307947593.git.sgw@linux.intel.com>
References: <cover.1307947593.git.sgw@linux.intel.com>
Subject: [*RFC CONSOLIDATED PULL RFC* 07/23] gconf-dbus: Update to 2.29.1 git
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
X-List-Received-Date: Mon, 13 Jun 2011 06:58:04 -0000

New version now uses git
set --enable-defaults-service=no so that polkit is not pulled in

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnome/{gconf-dbus_svn.bb => gconf-dbus_git.bb} |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/gnome/{gconf-dbus_svn.bb => gconf-dbus_git.bb} (76%)

diff --git a/meta/recipes-gnome/gnome/gconf-dbus_svn.bb b/meta/recipes-gnome/gnome/gconf-dbus_git.bb
similarity index 76%
rename from meta/recipes-gnome/gnome/gconf-dbus_svn.bb
rename to meta/recipes-gnome/gnome/gconf-dbus_git.bb
index 16a2ddb..2b6f9c3 100644
--- a/meta/recipes-gnome/gnome/gconf-dbus_svn.bb
+++ b/meta/recipes-gnome/gnome/gconf-dbus_git.bb
@@ -8,19 +8,17 @@ PROVIDES = "gconf"
 RPROVIDES_${PN} = "gconf"
 RPROVIDES_${PN}-dev = "gconf-dev"
 
-SRCREV = "705"
-PV = "2.16.0+svnr${SRCPV}"
+SRCREV = "d096734a6c53954baa64e3ce8a62d11296b9eaab"
+PV = "2.29.1+git${SRCPV}"
 
-SRC_URI = "svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http"
-S = "${WORKDIR}/trunk"
+SRC_URI = "git://meego.gitorious.org/meego-os-base/gconf-dbus.git"
+S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools
 
 PARALLEL_MAKE = ""
 
-
-EXTRA_OECONF = "--disable-gtk-doc --disable-gtk --enable-shared --disable-static --enable-debug=yes"
-
+EXTRA_OECONF = "--disable-gtk-doc --disable-gtk --enable-shared --disable-static --enable-debug=yes --enable-defaults-service=no"
 
 do_configure_prepend() {
         touch gtk-doc.make
-- 
1.7.3.4



