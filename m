Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Sm7jH-0003as-Q6
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:21:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2012 11:10:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188062976"
Received: from unknown (HELO localhost) ([10.255.12.166])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2012 11:10:39 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 13:10:29 -0500
Message-Id: <51e0e241eac78a4f03349c677d95859cffc49265.1341338051.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
References: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1341338051.git.tom.zanussi@intel.com>
References: <cover.1341338051.git.tom.zanussi@intel.com>
Subject: [PATCH 2/9] perl: add @STAGINGDIR@ for config.sh substitions
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
X-List-Received-Date: Tue, 03 Jul 2012 18:21:40 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

For some config.sh substitions, we'd like to be able to use
STAGING_DIR_HOST; add @STAGINGDIR@ to allow for that.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index a50fedb..3ba1223 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -147,6 +147,7 @@ do_configure() {
         sed -i -e 's,@DESTDIR@,${prefix},g' \
                -e 's,@ARCH@-thread-multi,,g' \
                -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
+               -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
                -e "s%/usr/include%${STAGING_INCDIR}%g" \
 	       -e 's,/usr/lib/,${libdir}/,g' \
 	       -e 's,/usr/,${exec_prefix}/,g' \
-- 
1.7.0.4



