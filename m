Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RJYBp-0002iM-VY
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 00:12:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Oct 2011 15:06:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,415,1315206000"; d="scan'208";a="83263181"
Received: from unknown (HELO swold-mobl.Mikenopa.local) ([10.255.15.81])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2011 15:06:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 00:06:23 +0200
Message-Id: <2d3dc5155e4df98e5d8abc4f92950d1c169d377a.1319753141.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/18] dbus-glib: fix QA Packaging issues
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
X-List-Received-Date: Thu, 27 Oct 2011 22:12:46 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/dbus/dbus-glib.inc     |    4 +++-
 meta/recipes-core/dbus/dbus-glib_0.92.bb |    2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib.inc b/meta/recipes-core/dbus/dbus-glib.inc
index 704dc04..80f68c8 100644
--- a/meta/recipes-core/dbus/dbus-glib.inc
+++ b/meta/recipes-core/dbus/dbus-glib.inc
@@ -19,7 +19,9 @@ EXTRA_OECONF = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-in
                 --with-dbus-binding-tool=${STAGING_BINDIR_NATIVE}/dbus-binding-tool"
 EXTRA_OECONF_virtclass-native = "--with-introspect-xml=${STAGING_DATADIR_NATIVE}/dbus/dbus-bus-introspect.xml"
 
-FILES_${PN} = "${libdir}/lib*.so.*"
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-bash_completion = "${sysconfdir}/bash_completion.d/dbus-bash-completion.sh \
+   ${libexecdir}/dbus-bash-completion-helper"
 FILES_${PN}-dev += "${libdir}/dbus-1.0/include ${bindir}/dbus-glib-tool"
 FILES_${PN}-dev += "${bindir}/dbus-binding-tool"
 
diff --git a/meta/recipes-core/dbus/dbus-glib_0.92.bb b/meta/recipes-core/dbus/dbus-glib_0.92.bb
index 72bea89..c7266d4 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.92.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.92.bb
@@ -1,6 +1,6 @@
 require dbus-glib.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "b595b36890c4f9f8f5d5dec131c495f8"
 SRC_URI[sha256sum] = "5a7fd4cf937cdcb7f2eed61341b70ee0f2607450a50db381618598adf60dd40e"
-- 
1.7.6.4



