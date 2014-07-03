Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D55E6084E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 07:49:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s637nDko026497
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Jul 2014 00:49:14 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Thu, 3 Jul 2014 00:49:13 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jul 2014 15:49:08 +0800
Message-ID: <1404373748-13016-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH] groff: remove redundant code snippet
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
X-List-Received-Date: Thu, 03 Jul 2014 07:49:14 -0000
Content-Type: text/plain

The exact same code snippet exists both in do_install_append and
do_install_append_class-native which is not necessary.

Remove it from do_install_append_class-native.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-extended/groff/groff_1.22.2.bb | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.2.bb
index 227f9fa..63f0425 100644
--- a/meta/recipes-extended/groff/groff_1.22.2.bb
+++ b/meta/recipes-extended/groff/groff_1.22.2.bb
@@ -55,14 +55,6 @@ do_install_append() {
 }
 
 do_install_append_class-native() {
-	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-	for i in afmtodit mmroff; do
-		if [ -f ${D}${bindir}/$i ]; then
-			sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/$i
-		fi
-	done
-
 	create_cmdline_wrapper ${D}/${bindir}/groff \
 		-F${STAGING_DIR_NATIVE}${datadir_native}/groff/${PV}/font \
 		-M${STAGING_DIR_NATIVE}${datadir_native}/groff/${PV}/tmac
-- 
1.8.4.1


