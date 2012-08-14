Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCB-0000Xj-Rk
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Aug 2012 05:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181040"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:13:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:12:48 +0300
Message-Id: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 01/64] rxvt-unicode: remove setting of LD_LIBRARY_PATH
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:04 -0000

This is no longer needed as we do not run tic at install time

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
index 2415ba5..1f144e6 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.15.bb
@@ -28,10 +28,6 @@ ALTERNATIVE_PATH = "${bindir}/rxvt"
 
 CFLAGS_append = " -fpermissive"
 
-# This is necessary so that the "tic" command executed during the install can
-# link with the correct libary in staging.
-export LD_LIBRARY_PATH = "${STAGING_LIBDIR_NATIVE}"
-
 EXTRA_OECONF = "--enable-menubar --enable-xim \
 		--enable-utmp --enable-wtmp --enable-lastlog \
 		--disable-strings --with-term=rxvt --enable-keepscrolling \
-- 
1.7.7.6



