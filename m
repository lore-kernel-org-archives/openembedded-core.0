Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4491A78517
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 02:10:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA92AtC1029315
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Nov 2017 18:10:55 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 8 Nov 2017 18:10:54 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Nov 2017 10:12:14 +0800
Message-ID: <63be4c8cb743c348c4648a43b4473e09d92182af.1510193452.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1510193452.git.Qi.Chen@windriver.com>
References: <cover.1510193452.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gawk: upgrade to 4.2.0
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
X-List-Received-Date: Thu, 09 Nov 2017 02:10:54 -0000
Content-Type: text/plain

test-arrayind1-Remove-hashbang-line.patch is dropped as it has
been merged in new version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../test-arrayind1-Remove-hashbang-line.patch      | 30 ----------------------
 .../gawk/{gawk-4.1.4 => gawk}/run-ptest            |  0
 .../gawk/{gawk_4.1.4.bb => gawk_4.2.0.bb}          |  5 ++--
 3 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-extended/gawk/gawk-4.1.4/test-arrayind1-Remove-hashbang-line.patch
 rename meta/recipes-extended/gawk/{gawk-4.1.4 => gawk}/run-ptest (100%)
 rename meta/recipes-extended/gawk/{gawk_4.1.4.bb => gawk_4.2.0.bb} (85%)

diff --git a/meta/recipes-extended/gawk/gawk-4.1.4/test-arrayind1-Remove-hashbang-line.patch b/meta/recipes-extended/gawk/gawk-4.1.4/test-arrayind1-Remove-hashbang-line.patch
deleted file mode 100644
index d4262ed..0000000
--- a/meta/recipes-extended/gawk/gawk-4.1.4/test-arrayind1-Remove-hashbang-line.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a3a3f26078223c47871c7b53e5c015ad163ae045 Mon Sep 17 00:00:00 2001
-From: Fabio Berton <fabio.berton@ossystems.com.br>
-Date: Thu, 3 Nov 2016 14:50:52 -0200
-Subject: [PATCH] test/arrayind1: Remove hashbang line
-Organization: O.S. Systems Software LTDA.
-
-Remove "#!/usr/local/bin/awk -f" as none of the other awk scripts in the
-test suite have a hashbang.
-
-Upstream-Status: Submitted [1]
-
-[1] https://lists.gnu.org/archive/html/bug-gawk/2016-11/msg00003.html
-
-Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
----
- test/arrayind1.awk | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/test/arrayind1.awk b/test/arrayind1.awk
-index 5d4a6f3..59e8b4e 100755
---- a/test/arrayind1.awk
-+++ b/test/arrayind1.awk
-@@ -1,4 +1,3 @@
--#!/usr/local/bin/awk -f
- # this script renums pedigrees with metafounders
- # so that they are added *before*regular animals
- # mf are ascertained because they are not in the 1st column
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/gawk/gawk-4.1.4/run-ptest b/meta/recipes-extended/gawk/gawk/run-ptest
similarity index 100%
rename from meta/recipes-extended/gawk/gawk-4.1.4/run-ptest
rename to meta/recipes-extended/gawk/gawk/run-ptest
diff --git a/meta/recipes-extended/gawk/gawk_4.1.4.bb b/meta/recipes-extended/gawk/gawk_4.2.0.bb
similarity index 85%
rename from meta/recipes-extended/gawk/gawk_4.1.4.bb
rename to meta/recipes-extended/gawk/gawk_4.2.0.bb
index 995d37d..27f79a2 100644
--- a/meta/recipes-extended/gawk/gawk_4.1.4.bb
+++ b/meta/recipes-extended/gawk/gawk_4.2.0.bb
@@ -17,11 +17,10 @@ PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
-           file://test-arrayind1-Remove-hashbang-line.patch \
 "
 
-SRC_URI[md5sum] = "f20c94ca51b6ebfc9bffb90f95c8ffbb"
-SRC_URI[sha256sum] = "8c03080e2b5a56263e8783f6f1f306398d4591be18254041f3f547efef944d35"
+SRC_URI[md5sum] = "0b598c31bc703d66082bd958d4189980"
+SRC_URI[sha256sum] = "c88046c6e8396ee548bcb941e16def809b7b55b60a1044b5dd254094f347c7d9"
 
 inherit autotools gettext texinfo update-alternatives
 
-- 
1.9.1


