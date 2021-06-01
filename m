Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.58650.1622557140349143945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sDf0xfNI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id t21so6956798plo.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WsL1NfPRSJisjGYj0WzCnEqVIjxxhmXAiEZe8rwGbE0=;
        b=sDf0xfNIFCw0ehMY6X76ygHhAGXUA6ktTUREG6/KUmZ5HqabI19MnLFqHPfsXLiw3g
         czbJiDea/dF/8uwCHO/yvK9yw07QZcXjm/I3faXJxY1YFeL0B3YZIEsaGukYDSq8m0p0
         krEO0DZ3WajLpNoUZj0kHWnZcTz6fkx9sgyn3m1Pwi5/aeOIMTfycZW/9EqX5JbBiXkM
         n0KiFxq7Vkgm8tJJ1Qwj65eWzMZtlhFKuAIdz70WiY5anverUrcTKPoYKgRFUSjxIww0
         HqORqf1OjuigEfgUy26HpqFO6IExxZjclNbU6I5ARp72WV9b+5Jn8/di+xfi9myovux5
         ivWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WsL1NfPRSJisjGYj0WzCnEqVIjxxhmXAiEZe8rwGbE0=;
        b=srFwuPEAG8jamOFI//O/UNQGX7qPVxPnyuBqeX+My/Ksy8f4IV2oIbJC/v5OsHHVeC
         fiMvXg1/UVA4omdmwTHWuc2YU/tXXe/21cr2BSLfccN28/Ea3K+6koh0JuhGTMIiyY4W
         S5BzUOAoZRpV0JDMPXAbu0O4aDvOOyiB1PVm/ISZpgTgyDKF7X5P9kguL8Vp/m7VuufJ
         hetumFdUNbwx/lOkhAlYtvDfacjOm19+PY9+v1+J1jWy5y1Noex2Jn35T4RF42LFH4CF
         A1qaT9E3icOhRG2DlJyNmn1aVX4wNm5urvUZwhkmCmeLYavl1J9AX9qUwrKZciTHNHqG
         6qBQ==
X-Gm-Message-State: AOAM530qsu/S8yBG5kQex9F7yaFkB4Evfycd8jCoPBjAgee9xCl1Ct8a
	d1/qGp5d76hdd8bQpjWVbJelmvBUx+IIHXrRieQ=
X-Google-Smtp-Source: ABdhPJz4AvfvyVCavdnZ8ABfzhGu1TrM1aDZF67Ua4aVRzQXK4BtvNu9cZqS3ZN12sm12yoQh9FNKg==
X-Received: by 2002:a17:90b:3587:: with SMTP id mm7mr23975648pjb.71.1622557139326;
        Tue, 01 Jun 2021 07:18:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.18.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:18:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/26] libxml2: Reformat runtest.patch
Date: Tue,  1 Jun 2021 04:18:01 -1000
Message-Id: <5f01e69b6e7b7f734882a30146cca89dbdb99705.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

Reformatted runtest.patch to allow it to be applied using git am.
This makes it easier to apply the series of patches to the original git repo.

There are no changes to the code of the patch other than the reformat.

Previously, the patch claimed to be a backport, but I have not found an
upstream commit so I've changed the Upstream-Status to pending.

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0361d625e1573e846a2f03ed90a8b897bc405160)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

