Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11P-00028G-RG
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520331"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:38 -0700
Message-Id: <0fbb9468a6bf4c02bc3187ffda3a1249ea272751.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 20/39] gettext: clean up FILE after PACKAGE reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:17 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb   |    3 ++-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    2 ++
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 0b7dfa3..50c5bbe 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ea3144f04c41cd2eada5d3f472e6ea5"
 
-PR = "r4"
+PR = "r5"
 DEPENDS = "virtual/libiconv"
 DEPENDS_virtclass-native = ""
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -51,6 +51,7 @@ do_configure_prepend() {
 # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
 
 PACKAGES =+ "libgettextlib libgettextsrc"
+FILES_${PN} = "${libdir}/${BPN}/*"
 FILES_libgettextlib = "${libdir}/libgettextlib-*.so*"
 FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
 
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 7dd8844..d9512fe 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -61,6 +61,8 @@ FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
 
 PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
 
+FILES_${PN} += "${libdir}/${BPN}/*"
+
 FILES_gettext-runtime = "${bindir}/gettext \
                          ${bindir}/ngettext \
                          ${bindir}/envsubst \
-- 
1.7.7.6



