Return-Path: <swee.aun.khor@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4A04A774FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 07:07:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 00:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,315,1496127600"; d="scan'208";a="1148285534"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2017 00:07:17 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 16:56:37 -0700
Message-Id: <d6a716541236f608f880a5914712303195027af6.1499127835.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1499127835.git.swee.aun.khor@intel.com>
References: <cover.1499127835.git.swee.aun.khor@intel.com>
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
X-List-Received-Date: Thu, 06 Jul 2017 07:07:18 -0000

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


