Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RpOrP-0004vE-Gd
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jan 2012 19:43:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Jan 2012 10:34:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="59212177"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.82])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Jan 2012 10:34:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 10:34:14 -0800
Message-Id: <72d351a4f232fbc7989871347f308e3611605a23.1327343524.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327343523.git.sgw@linux.intel.com>
References: <cover.1327343523.git.sgw@linux.intel.com>
Subject: [PATCH v2 09/21] apr-util: refactor packages for staticdev
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
X-List-Received-Date: Mon, 23 Jan 2012 18:43:20 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/apr/apr-util_1.4.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.4.1.bb b/meta/recipes-support/apr/apr-util_1.4.1.bb
index d0e19b0..029cf7e 100644
--- a/meta/recipes-support/apr/apr-util_1.4.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.4.1.bb
@@ -45,6 +45,6 @@ do_configure_append_virtclass-native() {
 }
 
 FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
-FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/apr_dbm_gdbm.*"
+FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/apr_dbm_gdbm.so* ${libdir}/apr-util-1/apr_dbm_gdbm.la"
 FILES_${PN}-dbg += "${libdir}/apr-util-1/.debug/*"
-
+FILES_${PN}-staticdev += "${libdir}/apr-util-1/apr_dbm_gdbm.a"
-- 
1.7.6.5



