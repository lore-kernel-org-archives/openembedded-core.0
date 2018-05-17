Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E0D0C7459D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 11:46:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2018 04:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,410,1520924400"; d="scan'208";a="229395395"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 17 May 2018 04:46:09 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 14:38:32 +0300
Message-Id: <20180517113837.24240-5-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180517113837.24240-1-alexander.kanavin@linux.intel.com>
References: <20180517113837.24240-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 05/10] libidn: upgrade 1.34 -> 1.35
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
X-List-Received-Date: Thu, 17 May 2018 11:46:10 -0000

Add autoconf-archive dependency to expand AC_JAVA_OPTIONS and other
java-related macros.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../libidn/libidn/libidn_fix_for_automake-1.12.patch      | 8 ++++----
 .../libidn/{libidn_1.34.bb => libidn_1.35.bb}             | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-extended/libidn/{libidn_1.34.bb => libidn_1.35.bb} (89%)

diff --git a/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch b/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
index 5d03810d006..3c0559e34f4 100644
--- a/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
+++ b/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
@@ -1,4 +1,4 @@
-From c34c7aba769bff3e483f89145055b9b8733435f3 Mon Sep 17 00:00:00 2001
+From d4f64b78419139eda3c0e1c6ee116bb5f70ea67c Mon Sep 17 00:00:00 2001
 From: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: Wed, 2 May 2012 18:05:19 -0700
 Subject: [PATCH] libtasn1: fix build with automake 1.12
@@ -19,11 +19,11 @@ Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index f8049a4..261dad2 100644
+index 8297649..7b9626e 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -33,6 +33,10 @@ AC_SUBST(LT_CURRENT, 17)
- AC_SUBST(LT_REVISION, 18)
+@@ -33,6 +33,10 @@ AC_SUBST(LT_CURRENT, 18)
+ AC_SUBST(LT_REVISION, 0)
  AC_SUBST(LT_AGE, 6)
  
 +# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
diff --git a/meta/recipes-extended/libidn/libidn_1.34.bb b/meta/recipes-extended/libidn/libidn_1.35.bb
similarity index 89%
rename from meta/recipes-extended/libidn/libidn_1.34.bb
rename to meta/recipes-extended/libidn/libidn_1.35.bb
index 424c6c9f981..d5ce5b46bd3 100644
--- a/meta/recipes-extended/libidn/libidn_1.34.bb
+++ b/meta/recipes-extended/libidn/libidn_1.35.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=df4be47940a91ee69556f5f71eed4aec \
                     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/idna.h;endline=21;md5=37cffad24807f446a24de3e7371f20b9 \
                     file://src/idn.c;endline=20;md5=09e97034a8877b3451cb65065fc2c06e"
-DEPENDS = "virtual/libiconv"
+DEPENDS = "virtual/libiconv autoconf-archive"
 
 inherit pkgconfig autotools gettext texinfo gtk-doc
 
@@ -21,8 +21,8 @@ SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
            file://0001-idn-format-security-warnings.patch \
            "
 
-SRC_URI[md5sum] = "a829db6cd0b85733017c20a50bf10798"
-SRC_URI[sha256sum] = "3719e2975f2fb28605df3479c380af2cf4ab4e919e1506527e4c7670afff6e3c"
+SRC_URI[md5sum] = "bef634141fe39326cb354b75e891fead"
+SRC_URI[sha256sum] = "f11af1005b46b7b15d057d7f107315a1ad46935c7fcdf243c16e46ec14f0fe1e"
 
 # command tool is under GPLv3+, while libidn itself is under LGPLv2.1+ or LGPLv3
 # so package command into a separate package
-- 
2.17.0


