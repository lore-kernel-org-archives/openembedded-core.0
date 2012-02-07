Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvI-0004HI-MF
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:04 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206375"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:45:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:26 -0800
Message-Id: <cb0e0e3de421e2dd8335765adb3c0e442177bb9a.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/35] webkit-gtk: Fix error.html resource path.
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:04 -0000

From: Peter Tworek <tworaz666@gmail.com>

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 meta/recipes-sato/webkit/webkit-gtk_svn.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
index 9652953..d754a39 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
@@ -14,7 +14,7 @@ SRCREV_FORMAT = "source"
 
 SRCREV = "101488"
 PV = "1.7.2+svnr${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "\
   svn://svn.webkit.org/repository/webkit/trunk/;module=Source;proto=http;name=source \
@@ -81,7 +81,7 @@ FILES_${PN}launcher = "${bindir}/GtkLauncher"
 FILES_${PN}launcher-dbg = "${bindir}/.debug/GtkLauncher"
 FILES_libjavascriptcore = "${libdir}/libjavascriptcoregtk-1.0.so.*"
 FILES_${PN}-webinspector = "${datadir}/webkitgtk-*/webinspector/"
-FILES_${PN} += "${datadir}/webkit-*/resources/error.html \
+FILES_${PN} += "${datadir}/webkitgtk-*/resources/error.html \
                 ${datadir}/webkitgtk-*/images \
                 ${datadir}/glib-2.0/schemas"
 
-- 
1.7.6.5



