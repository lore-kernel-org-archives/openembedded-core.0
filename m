Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18BE671486
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 05:20:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8I5KigD006662
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 22:20:44 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 17 Sep 2014 22:20:44 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Sep 2014 13:20:28 +0800
Message-ID: <216b38b077ec0e142c9c022882c4c39238572d8c.1411017574.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1411017574.git.Chong.Lu@windriver.com>
References: <cover.1411017574.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] perl: remove unneeded patches in ptest directory
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
X-List-Received-Date: Thu, 18 Sep 2014 05:20:44 -0000
Content-Type: text/plain

The perl patches have been copied to ptest directory and these patches in
target rootfs are linked to build dir. The ptest of perl doesn't need these
patches, so remove them from target.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/perl/perl-ptest.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-devtools/perl/perl-ptest.inc
index 6a9df4a..948ea7c 100644
--- a/meta/recipes-devtools/perl/perl-ptest.inc
+++ b/meta/recipes-devtools/perl/perl-ptest.inc
@@ -8,7 +8,7 @@ do_install_ptest () {
 	sed -e "s:\/opt:\/usr:" -i Porting/add-package.pl
 	sed -e "s:\/local\/gnu\/:\/:" -i hints/cxux.sh
 	tar -cf - * --exclude \*.o --exclude libperl.so --exclude Makefile --exclude makefile --exclude hostperl \
-		--exclude miniperl --exclude generate_uudmap | ( cd ${D}${PTEST_PATH} && tar -xf - )
+		--exclude miniperl --exclude generate_uudmap --exclude patches | ( cd ${D}${PTEST_PATH} && tar -xf - )
 
 	sed -i -e "s,${D},,g" \
 	       -e "s,--sysroot=${STAGING_DIR_HOST},,g" \
-- 
1.9.1


