Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuQir-0004Ok-8x
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 18:15:33 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2012 09:04:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127214037"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2012 09:04:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 09:04:00 -0700
Message-Id: <1343318640-28658-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH v2] guile: Add continuation marker to create_wrapper
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
X-List-Received-Date: Thu, 26 Jul 2012 16:15:33 -0000

This was causing the x86_64-linux-guile script to not have all the
environment bits needed

V2: Forgot PR Bump!

[YOCTO #2835]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/guile/guile_2.0.5.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.5.bb b/meta/recipes-devtools/guile/guile_2.0.5.bb
index 6c96f87..0e21d5e 100644
--- a/meta/recipes-devtools/guile/guile_2.0.5.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.5.bb
@@ -30,7 +30,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.gz \
 SRC_URI[md5sum] = "bcf70d54b44c99cb9acd3f63c5486b4b"
 SRC_URI[sha256sum] = "2a026ea6cdbc51ca71bcd9787839debfa45ac5db1e26dc00b30ca9b128b10956"
 
-PR = "r3"
+PR = "r4"
 
 inherit autotools gettext
 BBCLASSEXTEND = "native"
@@ -66,7 +66,7 @@ do_install_append_virtclass-native() {
 	create_wrapper ${D}/${bindir}/guile \
 		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
 		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
-	create_wrapper ${D}${bindir}/${HOST_SYS}-guile
+	create_wrapper ${D}${bindir}/${HOST_SYS}-guile \
 		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
 		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
 }
-- 
1.7.7.6



