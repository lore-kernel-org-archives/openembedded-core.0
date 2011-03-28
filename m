Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q4Lwi-0004VK-Cg
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2011 01:34:04 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Mar 2011 16:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,258,1299484800"; d="scan'208";a="902842908"
Received: from unknown (HELO localhost) ([10.255.16.103])
	by fmsmga001.fm.intel.com with ESMTP; 28 Mar 2011 16:32:05 -0700
Message-Id: <f0940e6755f625fcb76d4ea7fd69001210c2504b.1301354978.git.josh@linux.intel.com>
In-Reply-To: <cover.1301354978.git.josh@linux.intel.com>
References: <cover.1301354978.git.josh@linux.intel.com>
Old-Date: Mon, 28 Mar 2011 13:18:51 +0100
Date: Tue, 29 Mar 2011  0:31:59 +0100
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 1/4] clutter: add 1.6.8
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
X-List-Received-Date: Mon, 28 Mar 2011 23:34:04 -0000

From: Joshua Lock <josh@linux.intel.com>

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb

diff --git a/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb b/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
new file mode 100644
index 0000000..7ead5f9
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
@@ -0,0 +1,25 @@
+require recipes-graphics/clutter/clutter.inc
+
+PR = "r0"
+
+PACKAGES =+ "${PN}-examples"
+FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
+
+SRC_URI = "http://source.clutter-project.org/sources/clutter/1.6/clutter-${PV}.tar.bz2 \
+           file://enable_tests-1.4.patch \
+           file://test-conformance-fix.patch"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+S = "${WORKDIR}/clutter-1.6.8"
+
+BASE_CONF += "--disable-introspection"
+
+EXTRA_OECONF += "--with-json=check"
+
+do_configure_prepend () {
+	# Disable DOLT
+	sed -i -e 's/^DOLT//' ${S}/configure.ac
+}
+
+SRC_URI[md5sum] = "5a3c6d8414d4e286aba0a936f344c9b1""
+SRC_URI[sha256sum] = "cc147b8e7e62ed4b9b8a83df3db9788cf37db0c83970ba876228433f32bda442"
-- 
1.7.4.1



