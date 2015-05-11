Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3BAD6013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 06:48:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4B6mFU4012025
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 23:48:15 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 10 May 2015 23:48:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 May 2015 23:48:14 -0700
Message-ID: <9a0b0f81e35b996735eb798539aa91646a6ee914.1431326848.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431326848.git.liezhi.yang@windriver.com>
References: <cover.1431326848.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] apr: 1.5.1 -> 1.5.2
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
X-List-Received-Date: Mon, 11 May 2015 06:48:16 -0000
Content-Type: text/plain

Updated upgrade-and-fix-1.5.1.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../apr/apr/upgrade-and-fix-1.5.1.patch            |   11 ++++-------
 .../apr/{apr_1.5.1.bb => apr_1.5.2.bb}             |    4 ++--
 2 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-support/apr/{apr_1.5.1.bb => apr_1.5.2.bb} (95%)

diff --git a/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch b/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
index 4bca384..9569645 100644
--- a/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
+++ b/meta/recipes-support/apr/apr/upgrade-and-fix-1.5.1.patch
@@ -16,7 +16,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 8 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 6f99733..5fe028f 100644
+index a2a5194..5fe028f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -46,7 +46,6 @@ LT_VERSION = @LT_VERSION@
@@ -31,11 +31,11 @@ index 6f99733..5fe028f 100644
  etags:
  	etags `find . -name '*.[ch]'`
  
--make_tools_dir:
+-OBJECTS_gen_test_char = tools/gen_test_char.lo $(LOCAL_LIBS)
+-tools/gen_test_char.lo: tools/gen_test_char.c
 -	$(APR_MKDIR) tools
+-	$(LT_COMPILE)
 -
--OBJECTS_gen_test_char = tools/gen_test_char.lo $(LOCAL_LIBS)
--tools/gen_test_char.lo: make_tools_dir
 -tools/gen_test_char@EXEEXT@: $(OBJECTS_gen_test_char)
 -	$(LINK_PROG) $(OBJECTS_gen_test_char) $(ALL_LIBS)
 +tools/gen_test_char@EXEEXT@: tools/gen_test_char.c
@@ -43,6 +43,3 @@ index 6f99733..5fe028f 100644
  
  include/private/apr_escape_test_char.h: tools/gen_test_char@EXEEXT@
  	$(APR_MKDIR) include/private
--- 
-1.8.1.2
-
diff --git a/meta/recipes-support/apr/apr_1.5.1.bb b/meta/recipes-support/apr/apr_1.5.2.bb
similarity index 95%
rename from meta/recipes-support/apr/apr_1.5.1.bb
rename to meta/recipes-support/apr/apr_1.5.2.bb
index 985ef67..aac6276 100644
--- a/meta/recipes-support/apr/apr_1.5.1.bb
+++ b/meta/recipes-support/apr/apr_1.5.2.bb
@@ -17,8 +17,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://upgrade-and-fix-1.5.1.patch \
 "
 
-SRC_URI[md5sum] = "5486180ec5a23efb5cae6d4292b300ab"
-SRC_URI[sha256sum] = "e94abe431d4da48425fcccdb27b469bd0f8151488f82e5630a56f26590e198ac"
+SRC_URI[md5sum] = "4e9769f3349fe11fc0a5e1b224c236aa"
+SRC_URI[sha256sum] = "7d03ed29c22a7152be45b8e50431063736df9e1daa1ddf93f6a547ba7a28f67a"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest
 
-- 
1.7.9.5


