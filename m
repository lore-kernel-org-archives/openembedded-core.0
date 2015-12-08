Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B308F606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 03:07:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB837dwv020313
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Dec 2015 19:07:39 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 7 Dec 2015 19:07:38 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <randy.macleod@windriver.com>
Date: Mon, 7 Dec 2015 19:07:38 -0800
Message-ID: <1449544058-9026-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] perl: do not use PERLHOSTLIB
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
X-List-Received-Date: Tue, 08 Dec 2015 03:07:41 -0000
Content-Type: text/plain

I don't like this one bit, which is why I am not
removing the now unused dynload patch.  If we look at
PERLHOSTLIB in target perl, we will be using the wrong
libraries when doing a self-hosted build for packages
that inherit cpan, and maybe others.

I think that only perl-native should heed PERLHOSTLIB,
but I'm not clear why it should need it.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.22.0.bb |    2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index 55ce73f..1f726c9 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -40,7 +40,6 @@ SRC_URI += " \
         file://Makefile.patch \
         file://Makefile.SH.patch \
         file://installperl.patch \
-        file://perl-dynloader.patch \
         file://perl-moreconfig.patch \
         file://letgcc-find-errno.patch \
         file://generate-sh.patch \
@@ -49,7 +48,6 @@ SRC_URI += " \
         file://cross-generate_uudmap.patch \
         file://fix_bad_rpath.patch \
         file://perl-archlib-exp.patch \
-        file://dynaloaderhack.patch \
         file://config.sh \
         file://config.sh-32 \
         file://config.sh-32-le \
-- 
1.7.9.5


