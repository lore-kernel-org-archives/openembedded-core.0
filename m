Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNZNC-0003Cy-7v
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 01:17:07 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72146538"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.75])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 16:10:39 -0800
Message-Id: <b40f39be9b22b945b27ff5ed7f5a539bae6d3fe5.1320709417.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
Subject: [PATCH 02/12] clutter-1.8: add 1.8.0
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
X-List-Received-Date: Tue, 08 Nov 2011 00:17:08 -0000

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb

diff --git a/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb b/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
new file mode 100644
index 0000000..efafbc2
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
@@ -0,0 +1,26 @@
+require recipes-graphics/clutter/clutter.inc
+
+PR = "r2"
+
+# Internal json-glib was removed in Clutter 1.5.2
+STDDEPENDS += "json-glib cogl atk"
+
+PACKAGES =+ "${PN}-examples"
+FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
+
+SRC_URI = "http://source.clutter-project.org/sources/clutter/1.8/clutter-${PV}.tar.bz2 \
+           file://enable_tests-1.4.patch \
+           file://update_gettext_macro_version.patch"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+S = "${WORKDIR}/clutter-${PV}"
+
+BASE_CONF += "--disable-introspection"
+
+do_configure_prepend () {
+	# Disable DOLT
+	sed -i -e 's/^DOLT//' ${S}/configure.ac
+}
+
+SRC_URI[md5sum] = "71454425366d9a49948cdd2af9eafc89"
+SRC_URI[sha256sum] = "79cd42c9a208b1bd2e2a0866ad7eb047a00835beabb401e99737af846812119c"
-- 
1.7.7



