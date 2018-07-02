Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 542F9771B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 05:47:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w625lOdB028346
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2018 22:47:24 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Sun, 1 Jul 2018 22:47:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 2 Jul 2018 13:57:07 +0800
Message-ID: <98993f8fe8c80ffd0c6edb80d62abc89426bc731.1530510873.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1530510873.git.hongxu.jia@windriver.com>
References: <cover.1530510873.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] gpgme: 1.10.0 -> 1.11.1
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
X-List-Received-Date: Mon, 02 Jul 2018 05:47:28 -0000
Content-Type: text/plain

License-Update: copyright years updated 2001-2017 -> 2001-2018

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch  | 18 +++++++++---------
 ...ang-python-gpg-error-config-should-not-be-use.patch | 10 +++++-----
 .../gpgme/0003-Correctly-install-python-modules.patch  |  6 +++---
 .../gpgme/gpgme/0004-python-import.patch               |  6 +++---
 ...onfig-skip-all-lib-or-usr-lib-directories-in-.patch |  6 +++---
 .../gpgme/gpgme/0006-fix-build-path-issue.patch        |  6 +++---
 .../gpgme/0007-qt-python-Add-variables-to-tests.patch  | 12 ++++++------
 .../gpgme/{gpgme_1.10.0.bb => gpgme_1.11.1.bb}         |  6 +++---
 8 files changed, 35 insertions(+), 35 deletions(-)
 rename meta/recipes-support/gpgme/{gpgme_1.10.0.bb => gpgme_1.11.1.bb} (93%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index f1997e1..ae9a46e 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -1,7 +1,7 @@
-From 265faf8fe0acaca2043a248a4df02b0868ffa6de Mon Sep 17 00:00:00 2001
+From c452ba58dd2f99d6e624421697417cc018f9a67a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Wed, 16 Aug 2017 02:00:08 -0400
-Subject: [PATCH 1/4] pkgconfig
+Date: Fri, 29 Jun 2018 14:35:41 +0800
+Subject: [PATCH 1/7] pkgconfig
 
 Update gpgme to use pkgconfig instead of -config files since its
 simpler and less error prone when cross compiling.
@@ -11,7 +11,7 @@ RP 2015/4/17
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Rebase to 1.9.0
+Rebase to 1.11.1
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
@@ -25,10 +25,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  create mode 100644 src/gpgme.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index 6ea4bcd..2a0d528 100644
+index 2a35404..7485cdf 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -887,6 +887,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -886,6 +886,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/versioninfo.rc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
@@ -37,7 +37,7 @@ index 6ea4bcd..2a0d528 100644
  AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig-w32.cmake.in)
  AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig.cmake.in)
 diff --git a/src/Makefile.am b/src/Makefile.am
-index ce6f1d4..5f38fee 100644
+index 0a196e0..cecaf8f 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -19,12 +19,14 @@
@@ -54,7 +54,7 @@ index ce6f1d4..5f38fee 100644
 +pkgconfigdir = $(libdir)/pkgconfig
 +pkgconfig_DATA = gpgme.pc gpgme-pthread.pc
  
- bin_PROGRAMS = gpgme-tool
+ bin_PROGRAMS = gpgme-tool gpgme-json
  
 diff --git a/src/gpgme-pthread.pc.in b/src/gpgme-pthread.pc.in
 new file mode 100644
@@ -299,5 +299,5 @@ index 0000000..b69539f
 +Requires: libassuan gpg-error
 \ No newline at end of file
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
index d20271e..4f5ceda 100644
--- a/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
+++ b/meta/recipes-support/gpgme/gpgme/0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch
@@ -1,7 +1,7 @@
-From 30f7a694cc4568ecb24f77c83a6123ed3f4075fa Mon Sep 17 00:00:00 2001
+From 45d828356efc140a1492befb1e6dc59a9f4e16b5 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 31 Jan 2018 10:44:19 +0800
-Subject: [PATCH] gpgme/lang/python: gpg-error-config should not be used
+Subject: [PATCH 2/7] gpgme/lang/python: gpg-error-config should not be used
 
 gpg-error-config was modified by OE to always return an error.
 So we want to find an alternative way to retrieve whatever it
@@ -19,7 +19,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 9 deletions(-)
 
 diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
-index f9dda20..9f5d61f 100755
+index 2595073..60b5257 100755
 --- a/lang/python/setup.py.in
 +++ b/lang/python/setup.py.in
 @@ -26,7 +26,6 @@ import shutil
@@ -30,7 +30,7 @@ index f9dda20..9f5d61f 100755
  gpgme_config_flags = ["--thread=pthread"]
  gpgme_config = ["gpgme-config"] + gpgme_config_flags
  gpgme_h = ""
-@@ -174,14 +173,7 @@ class BuildExtFirstHack(build):
+@@ -157,14 +156,7 @@ class BuildExtFirstHack(build):
  
      def _generate_errors_i(self):
  
@@ -47,5 +47,5 @@ index f9dda20..9f5d61f 100755
          filter_re = re.compile(r'GPG_ERR_[^ ]* =')
          rewrite_re = re.compile(r' *(.*) = .*')
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
index 7c9cccc..330bec6 100644
--- a/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
+++ b/meta/recipes-support/gpgme/gpgme/0003-Correctly-install-python-modules.patch
@@ -1,7 +1,7 @@
-From 93aae34ee70b8d50b31a19a65d6ac8290cb148ae Mon Sep 17 00:00:00 2001
+From 60baf9ebf30bed0e2ee3c7c5a74d5b6d50035862 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 30 Jan 2018 15:28:49 +0800
-Subject: [PATCH 2/4] Correctly install python modules
+Subject: [PATCH 3/7] Correctly install python modules
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
@@ -29,5 +29,5 @@ index 8d74cbd..ce4f0a5 100644
  	done
  
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-support/gpgme/gpgme/0004-python-import.patch b/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
index d2b039d..1a60f79 100644
--- a/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
+++ b/meta/recipes-support/gpgme/gpgme/0004-python-import.patch
@@ -1,7 +1,7 @@
-From 32ecc3f058307060e40af86127cd226248a73c41 Mon Sep 17 00:00:00 2001
+From fd7dcceeee439eb479edbb418bab635343414ee6 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 16 Aug 2017 02:06:45 -0400
-Subject: [PATCH 3/4] python import
+Subject: [PATCH 4/7] python import
 
 Don't check for output on stderr to know if an import worked, host inputrc and
 sysroot readline can cause warnings on stderr.
@@ -30,5 +30,5 @@ index b990d5b..318b089 100644
  	else
  		AC_MSG_RESULT([no])
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
index 963ae87..2da7904 100644
--- a/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
+++ b/meta/recipes-support/gpgme/gpgme/0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch
@@ -1,7 +1,7 @@
-From 6dcedc4dd055af902719b1a1cb10daa935a27f58 Mon Sep 17 00:00:00 2001
+From a58d90632a9907be3e8001800a143ac19075241a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 13 Apr 2017 16:40:27 +0300
-Subject: [PATCH 4/4] gpgme-config: skip all /lib* or /usr/lib* directories in
+Subject: [PATCH 5/7] gpgme-config: skip all /lib* or /usr/lib* directories in
  output
 
 The logic was not working in multilib setups which use other
@@ -27,5 +27,5 @@ index a4d152e..8342865 100644
                        ;;
                    -L*|-l*)
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
index 8cc8983..26ff472 100644
--- a/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
+++ b/meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
@@ -1,7 +1,7 @@
-From 180a5669e4a13a550b1b0dcef1689b6c0470fe54 Mon Sep 17 00:00:00 2001
+From 4f83750ce402b65d16cc09f8a0274a7ec76fc634 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 31 Jan 2018 11:01:09 +0800
-Subject: [PATCH] fix build path issue
+Subject: [PATCH 6/7] fix build path issue
 
 Get the "--root" directory supplied to the "install" command,
 and use it as a prefix to strip off the purported filename
@@ -33,5 +33,5 @@ index ce4f0a5..5a468f1 100644
  	done
  
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-support/gpgme/gpgme/0007-qt-python-Add-variables-to-tests.patch b/meta/recipes-support/gpgme/gpgme/0007-qt-python-Add-variables-to-tests.patch
index ce3745c..63eeacf 100644
--- a/meta/recipes-support/gpgme/gpgme/0007-qt-python-Add-variables-to-tests.patch
+++ b/meta/recipes-support/gpgme/gpgme/0007-qt-python-Add-variables-to-tests.patch
@@ -1,7 +1,7 @@
-From f47e8c6f9e461803468a64581d3640d873352eaa Mon Sep 17 00:00:00 2001
+From d3087348348b4a7fcfb05bf2a75b4a63453e1c77 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 1 Feb 2018 10:14:30 +0800
-Subject: [PATCH] qt/python: Add variables to tests
+Subject: [PATCH 7/7] qt/python: Add variables to tests
 
 * configure.ac, lang/python/Makefile.am:
   New variable to `lang/python', set to `lang/python' if RUN_LANG_PYTHON_TESTS
@@ -19,10 +19,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  3 files changed, 21 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 608c376..fad7467 100644
+index 7485cdf..4aa216d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -536,6 +536,17 @@ AC_ARG_ENABLE(g13-test,
+@@ -535,6 +535,17 @@ AC_ARG_ENABLE(g13-test,
           run_g13_test=$enableval)
  AM_CONDITIONAL(RUN_G13_TESTS, test "$run_g13_test" = "yes")
  
@@ -41,7 +41,7 @@ index 608c376..fad7467 100644
  # Checks for header files.
  AC_CHECK_HEADERS_ONCE([locale.h sys/select.h sys/uio.h argp.h
 diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
-index 8d74cbd..43b5d1e 100644
+index 5a468f1..43b9788 100644
 --- a/lang/python/Makefile.am
 +++ b/lang/python/Makefile.am
 @@ -24,7 +24,10 @@ EXTRA_DIST = \
@@ -74,5 +74,5 @@ index ab85960..a244ede 100644
  
  EXTRA_DIST = README
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta/recipes-support/gpgme/gpgme_1.10.0.bb b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
similarity index 93%
rename from meta/recipes-support/gpgme/gpgme_1.10.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.11.1.bb
index f015f3a..151fc03 100644
--- a/meta/recipes-support/gpgme/gpgme_1.10.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=9d157d08a69059344e6f82abd2d25781 \
+                    file://src/gpgme.h.in;endline=23;md5=4d6319e587fd944adfe61a41a8f15b36 \
                     file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
@@ -20,8 +20,8 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0007-qt-python-Add-variables-to-tests.patch \
           "
 
-SRC_URI[md5sum] = "78b1533c593478982ee2fc548260c563"
-SRC_URI[sha256sum] = "1a8fed1197c3b99c35f403066bb344a26224d292afc048cfdfc4ccd5690a0693"
+SRC_URI[md5sum] = "129c46fb85a7ffa41e43345e48aee884"
+SRC_URI[sha256sum] = "2d1b111774d2e3dd26dcd7c251819ce4ef774ec5e566251eb9308fa7542fbd6f"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
-- 
2.7.4


