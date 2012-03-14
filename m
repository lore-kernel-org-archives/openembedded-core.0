Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7jmj-0004Xg-RV
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:42:18 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Mar 2012 01:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="138551621"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2012 01:33:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 01:33:22 -0700
Message-Id: <178bd7b02847bd4bffdf7b78ffd900f078a3d633.1331713807.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331713807.git.sgw@linux.intel.com>
References: <cover.1331713807.git.sgw@linux.intel.com>
Subject: [PATCH 11/14] libgalago: Fix package warnings by not packaging autopackage
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
X-List-Received-Date: Wed, 14 Mar 2012 08:42:18 -0000

WARNING: For recipe libgalago, the following files/directories were installed but not shipped in any package:
WARNING:   /usr/share/autopackage
WARNING:   /usr/share/autopackage/skeletons
WARNING:   /usr/share/autopackage/skeletons/@galago.info
WARNING:   /usr/share/autopackage/skeletons/@galago.info/libgalago
WARNING:   /usr/share/autopackage/skeletons/@galago.info/libgalago/skeleton.1
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
index f5aba54..1a5dd23 100644
--- a/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
+++ b/meta/recipes-connectivity/galago/libgalago_0.5.2.bb
@@ -22,3 +22,8 @@ EXTRA_OECONF = "--disable-tests --disable-check"
 do_configure_prepend_libc-uclibc() {
         touch ${S}/config.rpath
 }
+
+do_install_append() {
+	# We don't package autopackage files
+	rm -rf ${D}${datadir}/autopackage
+}
-- 
1.7.7.6



