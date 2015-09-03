Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 79CBC77011
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 15:32:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 03 Sep 2015 08:32:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,462,1437462000"; d="scan'208";a="797539730"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Sep 2015 08:32:55 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 18:34:18 +0300
Message-Id: <828afb2cfb05ba5642fd681d239bdd0d264ebd73.1441293149.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/12] remake: update to 4.1+dbg-1.1
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
X-List-Received-Date: Thu, 03 Sep 2015 15:32:55 -0000

remake-remove-errors-about-colophon-and-cygnus-comma.patch has been merged upstream

inherit pkgconfig has been added because m4 macros defined by pkgconfig are now used
in configure.ac

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/remake/remake.inc            |  4 +--
 ...ve-errors-about-colophon-and-cygnus-comma.patch | 39 ----------------------
 .../{remake_git.bb => remake_4.1+dbg-1.1.bb}       |  8 ++---
 3 files changed, 4 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-devtools/remake/remake/remake-remove-errors-about-colophon-and-cygnus-comma.patch
 rename meta/recipes-devtools/remake/{remake_git.bb => remake_4.1+dbg-1.1.bb} (80%)

diff --git a/meta/recipes-devtools/remake/remake.inc b/meta/recipes-devtools/remake/remake.inc
index 6ac833e..df889fc 100644
--- a/meta/recipes-devtools/remake/remake.inc
+++ b/meta/recipes-devtools/remake/remake.inc
@@ -1,4 +1,4 @@
-SUMMARY = "Makefile debugger which is gnumake 3.81 compatible"
+SUMMARY = "Makefile debugger which is gnumake compatible"
 DESCRIPTION = "remake is a patched and modernized version of GNU make \
 utility that adds improved error reporting, the ability to trace \
 execution in a comprehensible way, and a debugger."
@@ -8,7 +8,7 @@ SECTION = "devel"
 
 SRC_URI = "git://github.com/rocky/remake.git"
 
-inherit autotools gettext update-alternatives
+inherit autotools gettext update-alternatives pkgconfig
 
 ALTERNATIVE_${PN} = "make"
 ALTERNATIVE_LINK_NAME[make] = "${bindir}/make"
diff --git a/meta/recipes-devtools/remake/remake/remake-remove-errors-about-colophon-and-cygnus-comma.patch b/meta/recipes-devtools/remake/remake/remake-remove-errors-about-colophon-and-cygnus-comma.patch
deleted file mode 100644
index 98b6460..0000000
--- a/meta/recipes-devtools/remake/remake/remake-remove-errors-about-colophon-and-cygnus-comma.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1316f10a97a4a2f5d11a30ec367aa61101318742 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@enea.com>
-Date: Wed, 6 Aug 2014 15:05:56 +0200
-Subject: [PATCH] remake: remove errors about @colophon and @cygnus commands
- not defined
-
-texinfo5 needs replacing @ with @@ when it is part of the text
-
-Upstream-Status: Backport
-Signed-off-by: Maxin B. John <maxin.john@enea.com>
----
- doc/remake.texi | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/doc/remake.texi b/doc/remake.texi
-index cd73437..fa5ba16 100644
---- a/doc/remake.texi
-+++ b/doc/remake.texi
-@@ -2752,7 +2752,7 @@ this list, we would like to add your names!
- @printindex cp
- 
- @tex
--% I think something like @colophon should be in texinfo.  In the
-+% I think something like @@colophon should be in texinfo.  In the
- % meantime:
- \long\def\colophon{\hbox to0pt{}\vfill
- \centerline{The body of this manual is set in}
-@@ -2764,7 +2764,7 @@ this list, we would like to add your names!
- \centerline{{\sl\fontname\tensl\/}}
- \centerline{are used for emphasis.}\vfill}
- \page\colophon
--% Blame: doc@cygnus.com, 1991.
-+% Blame: doc@@cygnus.com, 1991.
- @end tex
- 
- @bye
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/remake/remake_git.bb b/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
similarity index 80%
rename from meta/recipes-devtools/remake/remake_git.bb
rename to meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
index 2ba2b80..c61913d 100644
--- a/meta/recipes-devtools/remake/remake_git.bb
+++ b/meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
@@ -1,4 +1,3 @@
-PR = "r1"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://tests/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
@@ -6,14 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 require remake.inc
 
 SRC_URI += "file://version-remake.texi.patch \
-            file://remake-remove-errors-about-colophon-and-cygnus-comma.patch \
            "
-SRCREV = "f05508e521987c8494c92d9c2871aec46307d51d"
+SRCREV = "cf54641d50a0165bb17622b3e9770f426ccbc561"
 S = "${WORKDIR}/git"
 
-PV = "3.82+dbg-0.9+git${SRCPV}"
-
-DEPENDS += "readline"
+DEPENDS += "readline guile"
 # Need to add "gettext-native" dependency to remake-native.
 # By default only "gettext-minimal-native" is added
 # when inherit gettext.
-- 
2.1.4


