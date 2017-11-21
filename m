Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 634C0786A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 00:07:31 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id r62so8508021pfd.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 16:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YZwXyoPFgo/8TM7rJWpKY2tCDTOmxohGS1anb0Ueq7U=;
	b=Na+E5pWy3mLNKistLhdNNe2Yh4Mq3vw0jer4LI3zJTpfDURWCNivGeyYEz8hVQdaTF
	kLhI9G7sqnOcyvDplkU9dazRLe8BEZjxw2laag5fxVQ9yzhhoYIIguINeVGHgXTE58hL
	WqLyLDweMHv19SY3pSu6qPyBnqqU4JiW69HsdebpZFsRLyGxtqSPKIJyptiuJXXnYa8C
	9wwrUSMCivBUD7SWBiEb9f1Q7UvemQf2eC9AYSpGXBMr9yYEB5tE1nHXBEdaTc4pmWr7
	VOiUbUlat4XrSWXMRcVA9p4JsebLL9N5OwNwlGqS7iQydwM2JuPxaM61QG7z5Nag6zrg
	37lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YZwXyoPFgo/8TM7rJWpKY2tCDTOmxohGS1anb0Ueq7U=;
	b=RsCBnniTeVIPdT+VNFWWopsuN0Ths7TLyh207bgEApRbANm3mWU/LRmSUYfijdIK82
	JRQI/v7W28vRJXTZBqwIRgegWLATRSSUhyEw1F07kFuifsKVex6syjLJkvznFXcGhz7l
	wdz0d0M0P8ph785O1x7flviJh0spPQxJ8957YPoA4OxZxt/UeGS5AqITE+camZdjxgJv
	nRcU07TTYl8ABU7d6u9RvCnErEbjzjnvnUsqHnNyDpIpyF5ePPWElRJAf21DwjJNB1O1
	CTULUfOam/K66tfNajJG7D2OEBXlVKg+F5FLO9YZrwc68CuIO8HqeZOv2iIZqtTU45v3
	Hs3g==
X-Gm-Message-State: AJaThX7O5TVUWRSCfbz0qX3UcllqT0JjJhKLhEqIwqy6u2gq3MlmXMLh
	m+do5IKH0Mi22izcwpejj4wTPg==
X-Google-Smtp-Source: AGs4zMYfV2Maa53eXlWN66M2v/N9+l37ees+lah3N3h749Z32ppnUv9fgQ4W7PQUrtNwmvOVowyQ7A==
X-Received: by 10.99.106.67 with SMTP id f64mr14704632pgc.162.1511222852535;
	Mon, 20 Nov 2017 16:07:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:b90e:aa41:7e0b:9c90])
	by smtp.gmail.com with ESMTPSA id m9sm4221109pgt.17.2017.11.20.16.07.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Nov 2017 16:07:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 16:07:12 -0800
Message-Id: <4e3c6bda42c49f5301484681ebbaf20101f80dc5.1511222485.git.akuster@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511222485.git.akuster@mvista.com>
References: <cover.1511222485.git.akuster@mvista.com>
Subject: [PATCH 2/5] nettle: update to 3.4 and cleanup
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
X-List-Received-Date: Tue, 21 Nov 2017 00:07:31 -0000

From: Armin Kuster <akuster@mvista.com>

merge .inc
forward ported two patches to work with 3.4

for more info see:
http://lists.gnu.org/archive/html/info-gnu/2017-11/msg00007.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...d-target-to-only-build-tests-not-run-them.patch | 46 ----------------------
 ...d-target-to-only-build-tests-not-run-them.patch | 38 ++++++++++++++++++
 ...k-header-files-of-openssl-only-if-enable_.patch | 26 ++++++------
 .../{nettle-3.3 => nettle-3.4}/dlopen-test.patch   |  0
 .../nettle/{files => nettle-3.4}/run-ptest         |  0
 meta/recipes-support/nettle/nettle_3.3.bb          | 19 ---------
 .../nettle/{nettle.inc => nettle_3.4.bb}           | 14 +++++++
 7 files changed, 64 insertions(+), 79 deletions(-)
 delete mode 100644 meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch
 create mode 100644 meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch
 rename meta/recipes-support/nettle/{nettle-3.3 => nettle-3.4}/check-header-files-of-openssl-only-if-enable_.patch (63%)
 rename meta/recipes-support/nettle/{nettle-3.3 => nettle-3.4}/dlopen-test.patch (100%)
 rename meta/recipes-support/nettle/{files => nettle-3.4}/run-ptest (100%)
 delete mode 100644 meta/recipes-support/nettle/nettle_3.3.bb
 rename meta/recipes-support/nettle/{nettle.inc => nettle_3.4.bb} (60%)

diff --git a/meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch
deleted file mode 100644
index 23da777..0000000
--- a/meta/recipes-support/nettle/files/Add-target-to-only-build-tests-not-run-them.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 46edf01cc98db9f9feec984897836dfdd26bdc8d Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 12 Aug 2015 23:27:27 +0300
-Subject: [PATCH] Add target to only build tests (not run them)
-
-Not sending upstream as this is only a start of a solution to
-installable tests: It's useful for us already as is.
-
-Upstream-Status: Inappropriate [not a complete solution]
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- Makefile.in           | 3 +++
- testsuite/Makefile.in | 2 ++
- 2 files changed, 5 insertions(+)
-
-diff --git a/Makefile.in b/Makefile.in
-index 08efb7d..7909342 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -55,6 +55,9 @@ clean distclean mostlyclean maintainer-clean tags:
- 	  echo "Making $@ in $$d" ; (cd $$d && $(MAKE) $@); done
- 	$(MAKE) $@-here
- 
-+buildtest:
-+	echo "Making $@ in testsuite" ; (cd testsuite && $(MAKE) $@)
-+
- check-here:
- 	true
- 
-diff --git a/testsuite/Makefile.in b/testsuite/Makefile.in
-index 6bc1907..bb65bf0 100644
---- a/testsuite/Makefile.in
-+++ b/testsuite/Makefile.in
-@@ -116,6 +116,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$(OBJEXT) ../nettle-internal.$(OBJEXT) \
- # data.
- VALGRIND = valgrind --error-exitcode=1 --leak-check=full --show-reachable=yes @IF_ASM@ --partial-loads-ok=yes
- 
-+buildtest: $(TS_ALL)
-+
- # The PATH update is for locating dlls on w*ndows.
- check: $(TS_ALL)
- 	LD_LIBRARY_PATH=../.lib PATH="../.lib:$$PATH" srcdir="$(srcdir)" \
--- 
-2.1.4
-
diff --git a/meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch b/meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch
new file mode 100644
index 0000000..c007060
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.4/Add-target-to-only-build-tests-not-run-them.patch
@@ -0,0 +1,38 @@
+Add target to only build tests (not run them)
+
+Not sending upstream as this is only a start of a solution to
+installable tests: It's useful for us already as is.
+
+Upstream-Status: Inappropriate [not a complete solution]
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Refactored for 3.4
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: nettle-3.4/Makefile.in
+===================================================================
+--- nettle-3.4.orig/Makefile.in
++++ nettle-3.4/Makefile.in
+@@ -55,6 +55,9 @@ clean distclean mostlyclean maintainer-c
+ 	  echo "Making $@ in $$d" ; (cd $$d && $(MAKE) $@); done
+ 	$(MAKE) $@-here
+ 
++buildtest:
++	echo "Making $@ in testsuite" ; (cd testsuite && $(MAKE) $@)
++
+ check-here:
+ 	true
+ 
+Index: nettle-3.4/testsuite/Makefile.in
+===================================================================
+--- nettle-3.4.orig/testsuite/Makefile.in
++++ nettle-3.4/testsuite/Makefile.in
+@@ -131,6 +131,8 @@ $(TARGETS) $(EXTRA_TARGETS): testutils.$
+ # data.
+ VALGRIND = valgrind --error-exitcode=1 --leak-check=full --show-reachable=yes @IF_ASM@ --partial-loads-ok=yes
+ 
++buildtest: $(TS_ALL)
++
+ # The PATH update is for windows dlls, DYLD_LIBRARY_PATH is for OSX.
+ check: $(TS_ALL)
+ 	LD_LIBRARY_PATH=../.lib PATH="../.lib:$$PATH" DYLD_LIBRARY_PATH=../.lib \
diff --git a/meta/recipes-support/nettle/nettle-3.3/check-header-files-of-openssl-only-if-enable_.patch b/meta/recipes-support/nettle/nettle-3.4/check-header-files-of-openssl-only-if-enable_.patch
similarity index 63%
rename from meta/recipes-support/nettle/nettle-3.3/check-header-files-of-openssl-only-if-enable_.patch
rename to meta/recipes-support/nettle/nettle-3.4/check-header-files-of-openssl-only-if-enable_.patch
index e7216ba..d5f2666 100644
--- a/meta/recipes-support/nettle/nettle-3.3/check-header-files-of-openssl-only-if-enable_.patch
+++ b/meta/recipes-support/nettle/nettle-3.4/check-header-files-of-openssl-only-if-enable_.patch
@@ -10,29 +10,27 @@ building for nettle.
 
 Upstream-Status: Pending
 Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
----
- configure.ac | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 4ead52c..982760f 100644
---- a/configure.ac
-+++ b/configure.ac
+refactored for 3.4. pending not in as of 3.4
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: nettle-3.4/configure.ac
+===================================================================
+--- nettle-3.4.orig/configure.ac
++++ nettle-3.4/configure.ac
 @@ -185,9 +185,11 @@ AC_HEADER_TIME
  AC_CHECK_SIZEOF(long)
  AC_CHECK_SIZEOF(size_t)
  
--AC_CHECK_HEADERS([openssl/blowfish.h openssl/des.h openssl/cast.h openssl/aes.h openssl/ecdsa.h],,
+-AC_CHECK_HEADERS([openssl/evp.h openssl/ecdsa.h],,
 -[enable_openssl=no
 - break])
 +if test "x$enable_openssl" = "xyes"; then
-+  AC_CHECK_HEADERS([openssl/blowfish.h openssl/des.h openssl/cast.h openssl/aes.h openssl/ecdsa.h],,
++  AC_CHECK_HEADERS([openssl/evp.h openssl/ecdsa.h],,
 +  [enable_openssl=no
-+  break])
++   break])
 +fi
  
+ # For use by the testsuite
  AC_CHECK_HEADERS([valgrind/memcheck.h])
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch b/meta/recipes-support/nettle/nettle-3.4/dlopen-test.patch
similarity index 100%
rename from meta/recipes-support/nettle/nettle-3.3/dlopen-test.patch
rename to meta/recipes-support/nettle/nettle-3.4/dlopen-test.patch
diff --git a/meta/recipes-support/nettle/files/run-ptest b/meta/recipes-support/nettle/nettle-3.4/run-ptest
similarity index 100%
rename from meta/recipes-support/nettle/files/run-ptest
rename to meta/recipes-support/nettle/nettle-3.4/run-ptest
diff --git a/meta/recipes-support/nettle/nettle_3.3.bb b/meta/recipes-support/nettle/nettle_3.3.bb
deleted file mode 100644
index 3951678..0000000
--- a/meta/recipes-support/nettle/nettle_3.3.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require nettle.inc
-
-LICENSE = "LGPLv3+ | GPLv2+"
-
-LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
-                    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e \
-                    file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e"
-
-SRC_URI += "\
-            file://check-header-files-of-openssl-only-if-enable_.patch \
-            "
-
-SRC_URI_append_class-target = "\
-            file://dlopen-test.patch \
-            "
-
-SRC_URI[md5sum] = "10f969f78a463704ae73529978148dbe"
-SRC_URI[sha256sum] = "46942627d5d0ca11720fec18d81fc38f7ef837ea4197c1f630e71ce0d470b11e"
diff --git a/meta/recipes-support/nettle/nettle.inc b/meta/recipes-support/nettle/nettle_3.4.bb
similarity index 60%
rename from meta/recipes-support/nettle/nettle.inc
rename to meta/recipes-support/nettle/nettle_3.4.bb
index af51fb6..b4e525c 100644
--- a/meta/recipes-support/nettle/nettle.inc
+++ b/meta/recipes-support/nettle/nettle_3.4.bb
@@ -1,14 +1,28 @@
 SUMMARY = "A low level cryptographic library"
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
 SECTION = "libs"
+LICENSE = "LGPLv3+ | GPLv2+"
+
+LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6 \
+                    file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e \
+                    file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e"
 
 DEPENDS += "gmp"
 
 SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz \
            file://Add-target-to-only-build-tests-not-run-them.patch \
            file://run-ptest \
+           file://check-header-files-of-openssl-only-if-enable_.patch \
            "
 
+SRC_URI_append_class-target = "\
+            file://dlopen-test.patch \
+            "
+
+SRC_URI[md5sum] = "dc0f13028264992f58e67b4e8915f53d"
+SRC_URI[sha256sum] = "ae7a42df026550b85daca8389b6a60ba6313b0567f374392e54918588a411e94"
+
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools ptest
-- 
2.7.4


