Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5899E73CDE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Apr 2015 01:11:35 +0000 (UTC)
Received: by iedfl3 with SMTP id fl3so113466108ied.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Apr 2015 18:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ngRdXORC0nNbvWnJPiu5hhRiBBaZ9xL7+GoRI4rxB/o=;
	b=HoVXag68+Tv5+lHYGFCuSYxvNdDIkCHTRMgf7M/qrGHUEvmlq/UWz/4SsXHJ90dBld
	PbO8BEIVhg9kBRjmC8KHXGdKeCprOlcd8nuB9hpmDS50tkcua+78uLM7lspuUfc5TGFv
	YGsch+cV00o1vToIAbZmXRGGcZafwNE6f2CPvm+EfHKlfqy77GjVRdqjzO8y+3EwSFCj
	EX+yjOUnHcgF6Pu3X8sy3ETrVcOe5RdRFOKJWyBGd/dWYW5gbfDWotAvBKVB2bEiZZkT
	Idro6CvPmYCKDutP/zLcYUHaxpcsPD85ffqpNB/jrIFD7HYSc3gXth3chK/MXH/3Rls1
	3u/A==
X-Received: by 10.107.47.216 with SMTP id v85mr7395980iov.86.1428109896014;
	Fri, 03 Apr 2015 18:11:36 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	b137sm6636948ioe.36.2015.04.03.18.11.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Apr 2015 18:11:35 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Apr 2015 18:11:14 -0700
Message-Id: <1428109874-2871-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1428109874-2871-1-git-send-email-armccurdy@gmail.com>
References: <1428109874-2871-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] libevent: update 2.0.21 -> 2.0.22
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
X-List-Received-Date: Sat, 04 Apr 2015 01:11:35 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../libevent/libevent-2.0.21/disable_tests.patch          | 15 ---------------
 .../libevent-2.0.21/obsolete_automake_macros.patch        | 15 ---------------
 .../libevent/{libevent_2.0.21.bb => libevent_2.0.22.bb}   | 11 +++--------
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-support/libevent/libevent-2.0.21/disable_tests.patch
 delete mode 100644 meta/recipes-support/libevent/libevent-2.0.21/obsolete_automake_macros.patch
 rename meta/recipes-support/libevent/{libevent_2.0.21.bb => libevent_2.0.22.bb} (61%)

diff --git a/meta/recipes-support/libevent/libevent-2.0.21/disable_tests.patch b/meta/recipes-support/libevent/libevent-2.0.21/disable_tests.patch
deleted file mode 100644
index 5d2c690..0000000
--- a/meta/recipes-support/libevent/libevent-2.0.21/disable_tests.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd libevent-2.0.21-stable/test/Makefile.am libevent-2.0.21-stable/test/Makefile.am
---- libevent-2.0.21-stable/test/Makefile.am	2012-05-31 07:08:19.000000000 +0300
-+++ libevent-2.0.21-stable/test/Makefile.am	2013-02-08 02:06:20.227475872 +0200
-@@ -19,8 +19,6 @@
- EXTRA_PROGRAMS = regress
- noinst_HEADERS = tinytest.h tinytest_macros.h regress.h tinytest_local.h
-
--TESTS = $(top_srcdir)/test/test.sh
--
- BUILT_SOURCES =
- if BUILD_REGRESS
- BUILT_SOURCES += regress.gen.c regress.gen.h
diff --git a/meta/recipes-support/libevent/libevent-2.0.21/obsolete_automake_macros.patch b/meta/recipes-support/libevent/libevent-2.0.21/obsolete_automake_macros.patch
deleted file mode 100644
index b559232..0000000
--- a/meta/recipes-support/libevent/libevent-2.0.21/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted [https://sourceforge.net/tracker/?func=detail&aid=3603774&group_id=50884&atid=461322]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd libevent-2.0.21-stable/configure.in libevent-2.0.21-stable/configure.in
---- libevent-2.0.21-stable/configure.in	2012-11-18 08:34:13.000000000 +0200
-+++ libevent-2.0.21-stable/configure.in	2013-02-08 02:03:58.403476183 +0200
-@@ -12,7 +12,7 @@
- AC_CONFIG_MACRO_DIR([m4])
-
- AM_INIT_AUTOMAKE(libevent,2.0.21-stable)
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
- AC_DEFINE(NUMERIC_VERSION, 0x02001500, [Numeric representation of the version])
-
- dnl Initialize prefix.
diff --git a/meta/recipes-support/libevent/libevent_2.0.21.bb b/meta/recipes-support/libevent/libevent_2.0.22.bb
similarity index 61%
rename from meta/recipes-support/libevent/libevent_2.0.21.bb
rename to meta/recipes-support/libevent/libevent_2.0.22.bb
index e198f09..3f9475e 100644
--- a/meta/recipes-support/libevent/libevent_2.0.21.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.22.bb
@@ -6,15 +6,10 @@ SECTION = "libs"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=45c5316ff684bcfe2f9f86d8b1279559"
 
-PR = "r1"
+SRC_URI = "${SOURCEFORGE_MIRROR}/levent/${BP}-stable.tar.gz"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/levent/${BP}-stable.tar.gz \
-           file://obsolete_automake_macros.patch \
-           file://disable_tests.patch \
-"
-
-SRC_URI[md5sum] = "b2405cc9ebf264aa47ff615d9de527a2"
-SRC_URI[sha256sum] = "22a530a8a5ba1cb9c080cba033206b17dacd21437762155c6d30ee6469f574f5"
+SRC_URI[md5sum] = "c4c56f986aa985677ca1db89630a2e11"
+SRC_URI[sha256sum] = "71c2c49f0adadacfdbe6332a372c38cf9c8b7895bb73dabeaa53cdcc1d4e1fa3"
 
 S = "${WORKDIR}/${BPN}-${PV}-stable"
 
-- 
1.9.1


