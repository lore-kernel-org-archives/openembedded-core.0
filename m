Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1STdoz-0006TA-6d
	for openembedded-core@lists.openembedded.org;
	Sun, 13 May 2012 20:47:09 +0200
Received: by lags15 with SMTP id s15so2869463lag.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 May 2012 11:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=sV0O7fvVqh7jojczP3cFh33qsIluah3i5Ytq3lI/5lY=;
	b=tzHJU+mDKJQm/XrD++ZGpaacEnvprj3mpViKbpSYLUenO24OcTo11Gk7GBe5+8DHvz
	fAYlIov0RH1+0vcag8YLsasi//HYNxfL7Fsy7Nw3gRQrdZNtdR7gMYY79m2dIx362MSC
	BMq0ZSvkHtEkD85P0S9L99ltoJQGiqSUqB4F90g8MDuzUl99ddZtFIWMdga3rRVtZRJv
	/Tie+BjVc0wnKszgTw3y8z52ijxeyUNiWFuPRAqF3MQAGEo+jltAyONwNBt70/StUCG2
	kng6M1DMCBkPl/coM6kt3e+VHuFwcILiYx1xfO3fDzhUR5gYszCDz7e8Cqa7tsDOrbnv
	EOMA==
Received: by 10.112.45.230 with SMTP id q6mr2376630lbm.103.1336934231222;
	Sun, 13 May 2012 11:37:11 -0700 (PDT)
Received: from alpha.cazfi.net (a91-153-5-101.elisa-laajakaista.fi.
	[91.153.5.101])
	by mx.google.com with ESMTPS id pp2sm16877281lab.3.2012.05.13.11.37.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 May 2012 11:37:10 -0700 (PDT)
Received: from cazfi by alpha.cazfi.net with local (Exim 4.77)
	(envelope-from <cazfi74@gmail.com>)
	id 1STdfI-0003Ju-Ld; Sun, 13 May 2012 21:37:08 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 May 2012 21:37:03 +0300
Message-Id: <1336934223-12734-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10
Subject: [PATCH] jpeg: update to upstream version 8d
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 13 May 2012 18:47:09 -0000

* fix_for_automake_1.11.2.patch removed as issue resolved upstream
* Have README as license file instead of several source files that just
  refer to it

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../jpeg/jpeg-8c/fix_for_automake_1.11.2.patch     |   28 --------------------
 .../{jpeg-8c => jpeg-8d}/debian-libjpeg7_7-1.diff  |    0
 meta/recipes-core/jpeg/{jpeg_8c.bb => jpeg_8d.bb}  |   13 ++++-----
 3 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch
 rename meta/recipes-core/jpeg/{jpeg-8c => jpeg-8d}/debian-libjpeg7_7-1.diff (100%)
 rename meta/recipes-core/jpeg/{jpeg_8c.bb => jpeg_8d.bb} (74%)

diff --git a/meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch b/meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch
deleted file mode 100644
index c0d7f3e..0000000
--- a/meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-The support for automatic de-ANSI-fication has been deprecated in
-automake 1.11.2, and will be removed altogether in automake 1.12
-
-This avoids this error:
-| configure.ac:24: automatic de-ANSI-fication support is deprecated
-| autoreconf: automake failed with exit status: 1
-| ERROR: autoreconf execution failed.
-NOTE: package jpeg-native-8c-r2: task do_configure: Failed
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2011/12/28
-
-
-Index: jpeg-8c/configure.ac
-===================================================================
---- jpeg-8c.orig/configure.ac
-+++ jpeg-8c/configure.ac
-@@ -21,7 +21,7 @@ AC_CANONICAL_TARGET
- 
- # Initialize Automake
- # Don't require all the GNU mandated files
--AM_INIT_AUTOMAKE([-Wall -Werror ansi2knr no-dist foreign])
-+AM_INIT_AUTOMAKE([-Wall -Werror no-dist foreign])
- 
- # Make --enable-silent-rules the default.
- # To get verbose build output you may configure
diff --git a/meta/recipes-core/jpeg/jpeg-8c/debian-libjpeg7_7-1.diff b/meta/recipes-core/jpeg/jpeg-8d/debian-libjpeg7_7-1.diff
similarity index 100%
rename from meta/recipes-core/jpeg/jpeg-8c/debian-libjpeg7_7-1.diff
rename to meta/recipes-core/jpeg/jpeg-8d/debian-libjpeg7_7-1.diff
diff --git a/meta/recipes-core/jpeg/jpeg_8c.bb b/meta/recipes-core/jpeg/jpeg_8d.bb
similarity index 74%
rename from meta/recipes-core/jpeg/jpeg_8c.bb
rename to meta/recipes-core/jpeg/jpeg_8d.bb
index 6aeaeaa..61f1c2e 100644
--- a/meta/recipes-core/jpeg/jpeg_8c.bb
+++ b/meta/recipes-core/jpeg/jpeg_8d.bb
@@ -4,23 +4,20 @@ HOMEPAGE = "http://www.ijg.org/"
 BUGTRACKER = ""
 
 LICENSE ="BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
-                    file://jpeglib.h;endline=14;md5=22f1e0f8fc71f6f7563146d3b210dbe5 \
-                    file://djpeg.c;endline=13;md5=ca89254925da06fef47e4b6468233432"
+LIC_FILES_CHKSUM = "file://README;md5=4f46756b064c225fae088903300e5c98"
 
 SECTION = "libs"
 
 DEPENDS = "libtool-cross"
 DEPENDS_virtclass-native = "libtool-native"
 
-PR = "r3"
+PR = "r0"
 
 SRC_URI = "http://www.ijg.org/files/jpegsrc.v${PV}.tar.gz \
-	   file://debian-libjpeg7_7-1.diff \
-           file://fix_for_automake_1.11.2.patch"
+	   file://debian-libjpeg7_7-1.diff"
 
-SRC_URI[md5sum] = "a2c10c04f396a9ce72894beb18b4e1f9"
-SRC_URI[sha256sum] = "edfc0b3e004b2fe58ffeeec89f96e3a3c28972c46725ec127d01edf8a1cc7c9a"
+SRC_URI[md5sum] = "52654eb3b2e60c35731ea8fc87f1bd29"
+SRC_URI[sha256sum] = "00029b1473f0f0ea72fbca3230e8cb25797fbb27e58ae2e46bb8bf5a806fe0b3"
 
 inherit autotools 
 
-- 
1.7.10



