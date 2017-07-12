Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3AC78049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 02:21:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6C2LcR7015006
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 19:21:39 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Jul 2017 19:21:38 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jul 2017 22:21:34 -0400
Message-ID: <f854a4976bca8e4259cbe83e7d43365fa36d5da7.1499825744.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1499825744.git.dengke.du@windriver.com>
References: <cover.1499825744.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] dropbear: reduce local pending patches
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
X-List-Received-Date: Wed, 12 Jul 2017 02:21:39 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-core/dropbear/dropbear/0003-configure.patch    | 13 +++++++------
 .../dropbear/fix-libtomcrypt-libtommath-ordering.patch      | 12 +++++++-----
 2 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear/0003-configure.patch b/meta/recipes-core/dropbear/dropbear/0003-configure.patch
index c53ab01..8469a50 100644
--- a/meta/recipes-core/dropbear/dropbear/0003-configure.patch
+++ b/meta/recipes-core/dropbear/dropbear/0003-configure.patch
@@ -1,19 +1,20 @@
-From c5f5c5054c1b15539dccf866e2c3faba7ed68456 Mon Sep 17 00:00:00 2001
+From 58dd24a80ca0f400d0761afd9ce2b7f684fc9125 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Thu, 25 Apr 2013 00:27:25 +0200
-Subject: [PATCH 3/6] configure: add a variable to allow openpty check to be cached
+Subject: [PATCH] configure: add a variable to allow openpty check to be cached
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [ https://github.com/mkj/dropbear/pull/48 ]
 
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
  configure.ac | 11 ++++++++---
  1 file changed, 8 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 05461f3..9c16d90 100644
+index 893b904..245408d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -166,15 +166,20 @@ AC_ARG_ENABLE(openpty,
+@@ -177,15 +177,20 @@ AC_ARG_ENABLE(openpty,
  			AC_MSG_NOTICE(Not using openpty)
  		else
  			AC_MSG_NOTICE(Using openpty if available)
@@ -38,5 +39,5 @@ index 05461f3..9c16d90 100644
  AC_ARG_ENABLE(syslog,
  	[  --disable-syslog        Don't include syslog support],
 -- 
-1.7.11.7
+2.8.1
 
diff --git a/meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch b/meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch
index de930f2..d27d1eb 100644
--- a/meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch
+++ b/meta/recipes-core/dropbear/dropbear/fix-libtomcrypt-libtommath-ordering.patch
@@ -1,4 +1,4 @@
-From 2fd8d2aedad0c50cdf1e43edd2387874b720ad4c Mon Sep 17 00:00:00 2001
+From 0999f907ec73db33309c2e4a771125649aaad466 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Fri, 16 Sep 2016 12:18:23 -0700
 Subject: [PATCH] fix libtomcrypt/libtommath ordering
@@ -11,18 +11,20 @@ prepended to LIBTOM_LIBS as they are found, not appended.
 Note that LIBTOM_LIBS is not used when linking with the bundled
 libtom libs.
 
-Upstream-Status: Pending
+Upstream-Status: Pending [ The dropbear upstream master branch already
+contains this, this patch will be droped when meet next release ]
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
  configure.ac | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index b6abe4c..85bb8bc 100644
+index 245408d..d624853 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -390,16 +390,16 @@ AC_ARG_ENABLE(bundled-libtom,
+@@ -393,16 +393,16 @@ AC_ARG_ENABLE(bundled-libtom,
  			AC_MSG_NOTICE(Forcing bundled libtom*)
  		else
  			BUNDLED_LIBTOM=0
@@ -44,5 +46,5 @@ index b6abe4c..85bb8bc 100644
  )
  
 -- 
-1.9.1
+2.8.1
 
-- 
2.8.1


