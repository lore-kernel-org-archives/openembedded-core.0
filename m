Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11O-00027q-FV
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520274"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:29 -0700
Message-Id: <a7851f509443e544e1234b52fc63165626053e67.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 11/39] libgpg-error: clean up FILE after PACKAGE reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:14 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../libgpg-error/libgpg-error_1.10.bb              |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
index 95f9e56..8186236 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.10.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 SECTION = "libs"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch"
@@ -18,12 +18,10 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "736a03daa9dc5873047d4eb4a9c22a16"
 SRC_URI[sha256sum] = "520629b4568b5c29b1991c8ffc267c8bdee5f223c7333c42a651b56f9b1c5431"
 
-# move libgpg-error-config into -dev package
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev += "${bindir}/*"
-
 inherit autotools binconfig pkgconfig gettext
 
+FILES_${PN}-dev += "${bindir}/gpg-error"
+
 do_install_append() {
 	# we don't have common lisp in OE
 	rm -rf "${D}${datadir}/common-lisp/"
-- 
1.7.7.6



