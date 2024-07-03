Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3EDEC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 14:28:16 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.51749.1720016892789278525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 07:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1sP0xu-00032D-8U; Wed, 03 Jul 2024 16:28:10 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1sP0xt-006s2Z-AQ; Wed, 03 Jul 2024 16:28:09 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <uol@pengutronix.de>)
	id 1sP0xt-00A5r0-0n;
	Wed, 03 Jul 2024 16:28:09 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: OpenEmbedded Core Developers <openembedded-core@lists.openembedded.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] buildhistory: fix typos
Date: Wed,  3 Jul 2024 16:28:06 +0200
Message-Id: <20240703142806.2405768-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 14:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201491

Fix some simple typos found while looking through the code.

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta/classes/buildhistory.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index fd53e924021c..c3d049aea380 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -58,7 +58,7 @@ SSTATEPOSTUNPACKFUNCS:append = " buildhistory_emit_outputsigs"
 sstate_installpkgdir[vardepsexclude] += "buildhistory_emit_outputsigs"
 SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] .= "| buildhistory_emit_outputsigs"
 
-# All items excepts those listed here will be removed from a recipe's
+# All items except those listed here will be removed from a recipe's
 # build history directory by buildhistory_emit_pkghistory(). This is
 # necessary because some of these items (package directories, files that
 # we no longer emit) might be obsolete.
@@ -153,7 +153,7 @@ python buildhistory_emit_pkghistory() {
             # Variables that need to be written to their own separate file
             self.filevars = dict.fromkeys(['pkg_preinst', 'pkg_postinst', 'pkg_prerm', 'pkg_postrm'])
 
-    # Should check PACKAGES here to see if anything removed
+    # Should check PACKAGES here to see if anything was removed
 
     def readPackageInfo(pkg, histfile):
         pkginfo = PackageInfo(pkg)
@@ -535,7 +535,7 @@ buildhistory_get_installed() {
 		grep -v kernel-module $1/depends-nokernel-nolibc-noupdate.dot > $1/depends-nokernel-nolibc-noupdate-nomodules.dot
 	fi
 
-	# add complementary package information
+	# Add complementary package information
 	if [ -e ${WORKDIR}/complementary_pkgs.txt ]; then
 		cp ${WORKDIR}/complementary_pkgs.txt $1
 	fi
@@ -573,7 +573,7 @@ buildhistory_get_sdk_installed_target() {
 
 buildhistory_list_files() {
 	# List the files in the specified directory, but exclude date/time etc.
-	# This is somewhat messy, but handles where the size is not printed for device files under pseudo
+	# This is somewhat messy, but handles cases where the size is not printed for device files under pseudo
 	( cd $1
 	find_cmd='find . ! -path . -printf "%M %-10u %-10g %10s %p -> %l\n"'
 	if [ "$3" = "fakeroot" ] ; then
@@ -587,7 +587,7 @@ buildhistory_list_files_no_owners() {
 	# List the files in the specified directory, but exclude date/time etc.
 	# Also don't output the ownership data, but instead output just - - so
 	# that the same parsing code as for _list_files works.
-	# This is somewhat messy, but handles where the size is not printed for device files under pseudo
+	# This is somewhat messy, but handles cases where the size is not printed for device files under pseudo
 	( cd $1
 	find_cmd='find . ! -path . -printf "%M -          -          %10s %p -> %l\n"'
 	if [ "$3" = "fakeroot" ] ; then
@@ -855,7 +855,7 @@ END
 		CMDLINE="${@buildhistory_get_cmdline(d)}"
 		if [ "$repostatus" != "" ] ; then
 			git add -A .
-			# porcelain output looks like "?? packages/foo/bar"
+			# Porcelain output looks like "?? packages/foo/bar"
 			# Ensure we commit metadata-revs with the first commit
 			buildhistory_single_commit "$CMDLINE" "$HOSTNAME" dummy
 			git gc --auto --quiet
@@ -990,7 +990,7 @@ def write_latest_ptest_result(d, histdir):
     output_ptest = os.path.join(histdir, 'ptest')
     if os.path.exists(input_ptest):
         try:
-            # Lock it avoid race issue
+            # Lock it to avoid race issue
             lock = bb.utils.lockfile(output_ptest + "/ptest.lock")
             bb.utils.mkdirhier(output_ptest)
             oe.path.copytree(input_ptest, output_ptest)
-- 
2.39.2


