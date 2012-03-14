Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7jmh-0004Xk-6R
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:42:15 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 01:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138551605"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2012 01:33:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 01:33:14 -0700
Message-Id: <b9834c7725420ea22df604edb994f6735927b2e7.1331713807.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
Subject: [PATCH 03/14] quilt: Fix docs packaging warnings
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

WARNING: For recipe quilt, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/share/doc
WARNING:   /usr/share/doc/quilt
WARNING:   /usr/share/doc/quilt/README
WARNING:   /usr/share/doc/quilt/quilt.pdf
WARNING:   /usr/share/doc/quilt/README.MAIL
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/quilt/quilt-0.51.inc |    2 +-
 meta/recipes-devtools/quilt/quilt_0.51.bb  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt-0.51.inc b/meta/recipes-devtools/quilt/quilt-0.51.inc
index c41e25e..e89013a 100644
--- a/meta/recipes-devtools/quilt/quilt-0.51.inc
+++ b/meta/recipes-devtools/quilt/quilt-0.51.inc
@@ -16,7 +16,7 @@ PACKAGES += "guards guards-doc"
 FILES_${PN} = "${sysconfdir} ${datadir}/quilt \
                ${bindir}/quilt ${libdir}/quilt"
 FILES_guards = "${bindir}/guards"
-FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${P}"
+FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${BPN}"
 FILES_guards-doc = "${mandir}/man1/guards.1"
 
 RDEPENDS_${PN} = "bash"
diff --git a/meta/recipes-devtools/quilt/quilt_0.51.bb b/meta/recipes-devtools/quilt/quilt_0.51.bb
index 1c6ca73..bc62161 100644
--- a/meta/recipes-devtools/quilt/quilt_0.51.bb
+++ b/meta/recipes-devtools/quilt/quilt_0.51.bb
@@ -4,4 +4,4 @@ RDEPENDS_${PN} += "patch diffstat bzip2 util-linux"
 SRC_URI += "file://aclocal.patch \
             file://gnu_patch_test_fix_target.patch \
            "
-PR = "r1"
+PR = "r2"
-- 
1.7.7.6



