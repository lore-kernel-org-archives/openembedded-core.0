Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.451.1621275433044340958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 11:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14HIHBn9030134
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 11:17:12 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 17 May 2021 11:17:11 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Mon, 17 May 2021 11:17:11 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21862)
	id C7867200F4; Mon, 17 May 2021 14:17:10 -0400 (EDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>,
        Tony Tascioglu
	<tony.tascioglu@windriver.com>
Subject: [PATCH 1/2] libxml2: Reformat runtest.patch
Date: Mon, 17 May 2021 14:16:38 -0400
Message-ID: <20210517181639.18586-1-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Reformatted runtest.patch to allow it to be applied using git am.
This makes it easier to apply the series of patches to the original git repo.

There are no changes to the code of the patch other than the reformat.

Previously, the patch claimed to be a backport, but I have not found an
upstream commit so I've changed the Upstream-Status to pending.

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../recipes-core/libxml/libxml2/runtest.patch | 45 ++++++++++---------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2/runtest.patch b/meta/recipes-core/libxml/libxml2/runtest.patch
index 0dbb353c0f..c7a90cd3dc 100644
--- a/meta/recipes-core/libxml/libxml2/runtest.patch
+++ b/meta/recipes-core/libxml/libxml2/runtest.patch
@@ -1,28 +1,33 @@
-Add 'install-ptest' rule. Print a standard result line for
-each test.
+From 6172ccd1e74bc181f5298f19e240234e12876abe Mon Sep 17 00:00:00 2001
+From: Tony Tascioglu <tony.tascioglu@windriver.com>
+Date: Tue, 11 May 2021 11:57:46 -0400
+Subject: [PATCH] Add 'install-ptest' rule.
+
+Print a standard result line for each test.
 
 Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Upstream-Status: Backport
+Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
 ---
- Makefile.am   |   9 ++++
+ Makefile.am   |   9 +++
  runsuite.c    |   1 +
  runtest.c     |   2 +
  runxmlconf.c  |   1 +
- testapi.c     | 122 ++++++++++++++++++++++++++++++---------------
- testchar.c    | 156 +++++++++++++++++++++++++++++++++++++++++-----------------
+ testapi.c     | 122 ++++++++++++++++++++++++++-------------
+ testchar.c    | 156 +++++++++++++++++++++++++++++++++++---------------
  testdict.c    |   1 +
  testlimits.c  |   1 +
  testrecurse.c |   2 +
  9 files changed, 210 insertions(+), 85 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 9c630be..7cfd04b 100644
+index 05d1671f..ae622745 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -202,6 +202,15 @@ runxmlconf_LDADD= $(LDADDS)
+@@ -198,6 +198,15 @@ runxmlconf_LDADD= $(LDADDS)
  #testOOM_DEPENDENCIES = $(DEPS)
  #testOOM_LDADD= $(LDADDS)
  
@@ -39,10 +44,10 @@ index 9c630be..7cfd04b 100644
            testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
  	[ -d test   ] || $(LN_S) $(srcdir)/test   .
 diff --git a/runsuite.c b/runsuite.c
-index aaab13e..9ba2c5d 100644
+index d24b5ec3..f7ff2521 100644
 --- a/runsuite.c
 +++ b/runsuite.c
-@@ -1162,6 +1162,7 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
+@@ -1147,6 +1147,7 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
  
      if (logfile != NULL)
          fclose(logfile);
@@ -51,10 +56,10 @@ index aaab13e..9ba2c5d 100644
  }
  #else /* !SCHEMAS */
 diff --git a/runtest.c b/runtest.c
-index addda5c..8ba5d59 100644
+index ffa98d04..470f95cb 100644
 --- a/runtest.c
 +++ b/runtest.c
-@@ -4501,6 +4501,7 @@ launchTests(testDescPtr tst) {
+@@ -4508,6 +4508,7 @@ launchTests(testDescPtr tst) {
      xmlCharEncCloseFunc(ebcdicHandler);
      xmlCharEncCloseFunc(eucJpHandler);
  
@@ -62,7 +67,7 @@ index addda5c..8ba5d59 100644
      return(err);
  }
  
-@@ -4577,6 +4578,7 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
+@@ -4588,6 +4589,7 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
      xmlCleanupParser();
      xmlMemoryDump();
  
@@ -71,7 +76,7 @@ index addda5c..8ba5d59 100644
  }
  
 diff --git a/runxmlconf.c b/runxmlconf.c
-index cef20f4..4f291fb 100644
+index 70f61017..e882b3a1 100644
 --- a/runxmlconf.c
 +++ b/runxmlconf.c
 @@ -595,6 +595,7 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
@@ -83,7 +88,7 @@ index cef20f4..4f291fb 100644
  }
  
 diff --git a/testapi.c b/testapi.c
-index 4a751e2..7ccc066 100644
+index ff8b470d..52b51d78 100644
 --- a/testapi.c
 +++ b/testapi.c
 @@ -1246,49 +1246,91 @@ static int
@@ -219,7 +224,7 @@ index 4a751e2..7ccc066 100644
  }
  
 diff --git a/testchar.c b/testchar.c
-index 0d08792..f555d3b 100644
+index 6866a175..7bce0132 100644
 --- a/testchar.c
 +++ b/testchar.c
 @@ -23,7 +23,7 @@ static void errorHandler(void *unused, xmlErrorPtr err) {
@@ -797,7 +802,7 @@ index 0d08792..f555d3b 100644
      /*
       * Cleanup function for the XML library.
 diff --git a/testdict.c b/testdict.c
-index 40bebd0..114b934 100644
+index 40bebd05..114b9347 100644
 --- a/testdict.c
 +++ b/testdict.c
 @@ -440,5 +440,6 @@ int main(void)
@@ -808,7 +813,7 @@ index 40bebd0..114b934 100644
      return(ret);
  }
 diff --git a/testlimits.c b/testlimits.c
-index 68c94db..1584434 100644
+index 059116a6..f0bee68d 100644
 --- a/testlimits.c
 +++ b/testlimits.c
 @@ -1634,5 +1634,6 @@ main(int argc ATTRIBUTE_UNUSED, char **argv ATTRIBUTE_UNUSED) {
@@ -819,7 +824,7 @@ index 68c94db..1584434 100644
      return(ret);
  }
 diff --git a/testrecurse.c b/testrecurse.c
-index f95ae1c..74c8f8b 100644
+index 0cbe25a6..3ecadb40 100644
 --- a/testrecurse.c
 +++ b/testrecurse.c
 @@ -892,6 +892,7 @@ launchTests(testDescPtr tst) {
@@ -838,5 +843,5 @@ index f95ae1c..74c8f8b 100644
      return(ret);
  }
 -- 
-2.7.4
+2.25.1
 
-- 
2.29.2

