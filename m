Return-Path: <swee.aun.khor@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7C45E77DB8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 10:54:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jul 2017 03:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,322,1496127600"; d="scan'208";a="876375129"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2017 03:54:27 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 20:43:52 -0700
Message-Id: <2eb4a8ae6ae0d545a262423513fcb8bdcf22a376.1499394173.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1499394173.git.swee.aun.khor@intel.com>
References: <cover.1499394173.git.swee.aun.khor@intel.com>
Subject: [PATCH 6/7] perl: Support musl-x32 build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Jul 2017 10:54:28 -0000

From: sweeaun <swee.aun.khor@intel.com>

Existing musl fixups in perl recipe doesn't cover linux-muslx32.
This is fixed to support musl-x32 build.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 meta/recipes-devtools/perl/perl_5.24.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index b0ceb84..95d9694 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -125,7 +125,7 @@ do_configure() {
         done
 
         # Fixups for musl
-        if [ "${TARGET_OS}" = "linux-musl" -o "${TARGET_OS}" = "linux-musleabi" ]; then
+        if [ "${TARGET_OS}" = "linux-musl" -o "${TARGET_OS}" = "linux-musleabi" -o "${TARGET_OS}" = "linux-muslx32" ]; then
                 sed -i -e "s,\(d_libm_lib_version=\)'define',\1'undef',g" \
                        -e "s,\(d_stdio_ptr_lval=\)'define',\1'undef',g" \
                        -e "s,\(d_stdio_ptr_lval_sets_cnt=\)'define',\1'undef',g" \
-- 
2.7.4


