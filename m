Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D443171ABC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 15:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 857C82E4E4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:17:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id buSAjfH+K8d7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:17:09 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id B1C222E4E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:17:09 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EFB41E086
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:17:09 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 940241E084
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:17:09 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:17:09 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 871121739
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:17:09 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v2KFH9kK019211
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 16:17:09 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v2KFH9XF019205
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Mar 2017 16:17:09 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 16:17:07 +0100
Message-Id: <20170320151707.19060-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] package.bbclass: Add PRIVATE_LIBS to list of package specific variables
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
X-List-Received-Date: Mon, 20 Mar 2017 15:17:10 -0000

Changes to PRIVATE_LIBS should change the sstate checksum. To make
that happen, it needs to be listed in the list of package specific
variables, therefore add it.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 467f5f1c5a..dd1b316989 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -2011,7 +2011,7 @@ python package_depchains() {
 
 # Since bitbake can't determine which variables are accessed during package
 # iteration, we need to list them here:
-PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE SKIP_FILEDEPS"
+PACKAGEVARS = "FILES RDEPENDS RRECOMMENDS SUMMARY DESCRIPTION RSUGGESTS RPROVIDES RCONFLICTS PKG ALLOW_EMPTY pkg_postinst pkg_postrm INITSCRIPT_NAME INITSCRIPT_PARAMS DEBIAN_NOAUTONAME ALTERNATIVE PKGE PKGV PKGR USERADD_PARAM GROUPADD_PARAM CONFFILES SYSTEMD_SERVICE LICENSE SECTION pkg_preinst pkg_prerm RREPLACES GROUPMEMS_PARAM SYSTEMD_AUTO_ENABLE SKIP_FILEDEPS PRIVATE_LIBS"
 
 def gen_packagevar(d):
     ret = []
-- 
2.12.0


