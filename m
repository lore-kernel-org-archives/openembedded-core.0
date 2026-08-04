Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0413C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 20:04:42 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25349.1785873876529371974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 13:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KbQiNcv0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026080420043883eb8268ba000207fc-0q7ho8@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026080420043883eb8268ba000207fc
        for <openembedded-core@lists.openembedded.org>;
        Tue, 04 Aug 2026 22:04:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vwMNVztz6ZypCyRieV3pFr+MMhkgcq20mSvR27YDVIM=;
 b=KbQiNcv0imZ91P2+ian/79PawLhQPmDwZ24ByTPb06prck85Yk0SlDDFzzx2uKCtTFP3NA
 leQh8dh78+PTJYJfmDbpJYP0oe9M3un11glrMtCXKdDbLyMmxmpO+Gu96rFIo0qQaxcE4h8S
 Z5+wVRSARG8ls/c6x0eW7o/301+ftju+ncWGisQhwGCQgztC3lYcfkmaHv1Pkos5JyUUTA/z
 Q90e0z33/dVcgxZNa+clnupzC2KTrZC6wGgow6mCMKWwCyqGnusWPdVrz5UOQb7GfieEtF8v
 Pl/5oyfmWVMu+/MJG6/hiG7ST2KqqWzTcU5gbeACTyjqftK+ijJnxUxA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 4/6] libxml2: upgrade 2.15.2 -> 2.15.3
Date: Tue,  4 Aug 2026 22:03:54 +0200
Message-ID: <20260804200356.2093270-4-peter.marko@siemens.com>
In-Reply-To: <20260804200356.2093270-1-peter.marko@siemens.com>
References: <20260804200356.2093270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 20:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242799

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: fd9928e49da740d11f402e13b00cf5401c81d5cd)

Release Notes:
* https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.13.3
  * Security
    * [CVE-2024-40896] Fix XXE protection in downstream code
  * Regressions
    * autotools: Use AC_CHECK_DECL to check for getentropy
    * xinclude: Fix fallback for text includes
    * io: Don't call getcwd in xmlParserGetDirectory
    * io: Fix return value of xmlFileRead
    * parser: Fix error return of xmlParseBalancedChunkMemory
  * Improvements
    * xinclude: Set error handler when parsing text
    * Undeprecate xmlKeepBlanksDefault

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ake-Fix-installation-directories-in-libxml2.patch | 12 ++++++------
 meta/recipes-core/libxml/libxml2/install-tests.patch |  9 +++------
 .../libxml/{libxml2_2.15.2.bb => libxml2_2.15.3.bb}  |  2 +-
 3 files changed, 10 insertions(+), 13 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.15.2.bb => libxml2_2.15.3.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
index 627f8472c3..d19b284866 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -1,4 +1,4 @@
-From 1a7e177a7315c856a2f0e3c2a17ee0fd9e297bc9 Mon Sep 17 00:00:00 2001
+From 803e6f21d3d7ef6399f6ffe58cd28fa6dc7b94e9 Mon Sep 17 00:00:00 2001
 From: Peter Marko <peter.marko@siemens.com>
 Date: Mon, 26 May 2025 21:11:14 +0200
 Subject: [PATCH] Revert "cmake: Fix installation directories in
@@ -15,10 +15,10 @@ Signed-off-by: Peter Marko <peter.marko@siemens.com>
  3 files changed, 7 insertions(+), 18 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index aaa02e3..fb241bb 100644
+index d8dc4e1..633334a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1065,17 +1065,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
+@@ -1008,17 +1008,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
  AC_SUBST(XML_PRIVATE_CFLAGS)
  AC_SUBST(XML_INCLUDEDIR)
  
@@ -37,7 +37,7 @@ index aaa02e3..fb241bb 100644
  AC_DEFINE_UNQUOTED([XML_SYSCONFDIR], ["$XML_SYSCONFDIR"],
                     [System configuration directory (/etc)])
 diff --git a/libxml2-config.cmake.in b/libxml2-config.cmake.in
-index e040a75..dc0d6b8 100644
+index ff6433f..b775cfe 100644
 --- a/libxml2-config.cmake.in
 +++ b/libxml2-config.cmake.in
 @@ -24,17 +24,20 @@
@@ -66,10 +66,10 @@ index e040a75..dc0d6b8 100644
  set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
  set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR})
 diff --git a/meson.build b/meson.build
-index 98bc6e3..3ef0bd0 100644
+index 2cfecb6..f78da31 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -599,9 +599,6 @@ config_cmake = configuration_data()
+@@ -593,9 +593,6 @@ config_cmake = configuration_data()
  config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
  config_cmake.set('LIBXML_MINOR_VERSION', v_min)
  config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 9269536af0..996ade614e 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 3381232bab7217b9cb47e7cc765c8380192069b0 Mon Sep 17 00:00:00 2001
+From c6b547e06beb0f0ba99e30d036f055eaed9ec4dc Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Fri, 17 Oct 2025 14:15:36 +0800
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 19ec305..64bf28a 100644
+index 0a2a729..7ca5bad 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -29,6 +29,14 @@ check_PROGRAMS = \
+@@ -30,6 +30,14 @@ check_PROGRAMS = \
  	testparser \
  	testrecurse
  
@@ -33,6 +33,3 @@ index 19ec305..64bf28a 100644
  bin_PROGRAMS = xmllint
  
  bin_SCRIPTS = xml2-config
--- 
-2.34.1
-
diff --git a/meta/recipes-core/libxml/libxml2_2.15.2.bb b/meta/recipes-core/libxml/libxml2_2.15.3.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.15.2.bb
rename to meta/recipes-core/libxml/libxml2_2.15.3.bb
index 9181949ea5..02507d8042 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.2.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.3.bb
@@ -21,7 +21,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-11979.patch \
            "
 
-SRC_URI[archive.sha256sum] = "c8b9bc81f8b590c33af8cc6c336dbff2f53409973588a351c95f1c621b13d09d"
+SRC_URI[archive.sha256sum] = "78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"

