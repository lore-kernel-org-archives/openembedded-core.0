Return-Path: <openembedded@mindchasers.com>
X-Greylist: delayed 1640 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 17 Aug 2014 16:50:18 UTC
Received: from smtp.webfaction.com (mail6.webfaction.com [74.55.86.74])
	by mail.openembedded.org (Postfix) with ESMTP id A7259617B8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 16:50:18 +0000 (UTC)
Received: from localhost.localdomain (c-68-38-40-177.hsd1.nj.comcast.net
	[68.38.40.177])
	by smtp.webfaction.com (Postfix) with ESMTP id EAF822279558
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Aug 2014 16:22:58 +0000 (UTC)
From: Bob Cochran <openembedded@mindchasers.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Aug 2014 12:22:55 -0400
Message-Id: <1408292575-11417-1-git-send-email-openembedded@mindchasers.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] fix up eglibc-utils description to match what is actually included
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
X-List-Received-Date: Sun, 17 Aug 2014 16:50:23 -0000

iconf must have been a typo for iconv
rpcinfo is found elsewhere (currently rpcbind) and not eglibc-utils - replace its mention with
rpcgen

Signed-off-by: Bob Cochran <openembedded@mindchasers.com>
---
 meta/recipes-core/eglibc/eglibc-package.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-core/eglibc/eglibc-package.inc
index c357a13..2a91fa6 100644
--- a/meta/recipes-core/eglibc/eglibc-package.inc
+++ b/meta/recipes-core/eglibc/eglibc-package.inc
@@ -66,7 +66,7 @@ DESCRIPTION_eglibc-extra-nss = "eglibc: nis, nisplus and hesiod search services.
 SUMMARY_ldd = "print shared library dependencies"
 DESCRIPTION_ldd = "${bindir}/ldd prints shared library dependencies for each program or shared library specified on the command line."
 SUMMARY_${PN}-utils = "Miscellaneous utilities provided by eglibc"
-DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconf, locale, gencat, rpcinfo, ..."
+DESCRIPTION_${PN}-utils = "Miscellaneous utilities including getconf, iconv, locale, gencat, rpcgen, ..."
 DESCRIPTION_libsotruss = "Library to support sotruss which traces calls through PLTs"
 DESCRIPTION_tzcode = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 
-- 
1.7.9.5


