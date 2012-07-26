Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuQhP-0004Lv-0T
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 18:14:03 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jul 2012 09:02:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="186878887"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2012 09:02:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 09:02:31 -0700
Message-Id: <1343318551-28205-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] guile: Add continuation marker to create_wrapper
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
X-List-Received-Date: Thu, 26 Jul 2012 16:14:03 -0000

This was causing the x86_64-linux-guile script to not have all the
environment bits needed

[YOCTO #2835]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/guile/guile_2.0.5.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.5.bb b/meta/recipes-devtools/guile/guile_2.0.5.bb
index 6c96f87..fcb5201 100644
--- a/meta/recipes-devtools/guile/guile_2.0.5.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.5.bb
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



