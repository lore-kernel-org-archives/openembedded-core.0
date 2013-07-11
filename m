Return-Path: <radu.moisan@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D364861663
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 12:47:45 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Jul 2013 05:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1043,1363158000"; d="scan'208";a="266923387"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jul 2013 05:47:45 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2013 15:47:45 +0300
Message-Id: <1373546865-24088-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] rxvt-unicode: Check existence of acinclude.m4
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
X-List-Received-Date: Thu, 11 Jul 2013 12:47:46 -0000

copy should only happen if acinclude.m4 doesn't exist

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb
index 9a47617..e417957 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.18.bb
@@ -42,7 +42,9 @@ EXTRA_OECONF = "--enable-menubar --enable-xim \
 		--with-x=${STAGING_DIR_HOST}${prefix}"
 
 do_configure_prepend () {
-	cp ${S}/aclocal.m4 ${S}/acinclude.m4
+	if [ ! -e ${S}/acinclude.m4 ]; then
+		cp ${S}/aclocal.m4 ${S}/acinclude.m4
+	fi
 }
 
 do_compile_prepend () {
-- 
1.7.9.5


