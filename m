Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D141C05052
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:07 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.13594.1713248039024288200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SbcMcz58;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=EPBuejmA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018ee58a8208-068969f3-b02a-49a5-b695-9d775c122f95-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+vm8huSnw7N8Vco5Ln5VpkiUUZJ71NEOeb1IK7BAS08=;
	b=SbcMcz58JPgz3k4t5XWIP/uASLy9R02PXIfllFWQWWM00s6Akm7ZQp0oht+CZCUe
	1KugV+jl3WsCz+HLE8w22/lI/T+yCfL2TVkX3vC96GvL9iRc/C2yDYBdc3pIAaxvNDh
	2ZGnE9vWXoZjuzMslNPtRzqTvuayg/v0VirNGykA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248043;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+vm8huSnw7N8Vco5Ln5VpkiUUZJ71NEOeb1IK7BAS08=;
	b=EPBuejmAaSxOR1RaUbbZdsjO7iq3ip2GqMcN6ByqLkX3SjboWFKDQyXPrDyL8zOL
	nValh74h8+bs/uZm1iroOtqVqlME7aLkaxMDe+Wh/RDg1f0fUqQbhP6LgI4RLwz1su7
	dwb8Kjque9Z+aCmHM9ARniUhm0qvT6EyOmCvqU74=
Content-Type: multipart/mixed; boundary="===============2936378414480301423=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk-doc: upgrading to 1.34.0 SUCCEEDED
Message-ID: <0101018ee58a8208-068969f3-b02a-49a5-b695-9d775c122f95-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:14:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198346

--===============2936378414480301423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk-doc* to *1.34.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk-doc-upgrade-1.33.2-1.34.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From cea3a4d9256b2f6f79b0dba9df26b24907974121 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 22:28:32 +0000
Subject: [PATCH] gtk-doc: upgrade 1.33.2 -> 1.34.0

---
 ...t-error-out-if-xsltproc-is-not-found.patch |  9 +++----
 ...code-paths-to-perl-python-in-scripts.patch | 23 +++++++++---------
 ...01-Don-t-use-docdir-from-environment.patch | 24 -------------------
 .../gtk-doc/files/conditionaltests.patch      | 14 ++++-------
 .../gtk-doc/files/no-clobber.patch            |  7 +++---
 .../gtk-doc/files/pkg-config-native.patch     |  3 +--
 .../{gtk-doc_1.33.2.bb => gtk-doc_1.34.0.bb}  |  3 +--
 7 files changed, 24 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdir-from-environment.patch
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.33.2.bb => gtk-doc_1.34.0.bb} (94%)

diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
index 99ae4d4417..b7afa528c3 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
@@ -1,4 +1,4 @@
-From 8b7fbbb405959f2868ad6eadd7dd00018758a8a5 Mon Sep 17 00:00:00 2001
+From c628deb5ddadbb5dde920b03cbcf9e5a4e1c4441 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 7 Sep 2016 14:52:04 +0300
 Subject: [PATCH] Do not error out if xsltproc is not found.
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index b0c88d7..2a61d6e 100644
+index 8725074..0491090 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -58,7 +58,7 @@ dnl Check for xsltproc
+@@ -37,7 +37,7 @@ dnl Check for xsltproc
  dnl
  AC_PATH_PROG([XSLTPROC], [xsltproc])
  if test -z "$XSLTPROC"; then
@@ -26,6 +26,3 @@ index b0c88d7..2a61d6e 100644
  fi
  
  dnl
--- 
-2.9.3
-
diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
index 19e05f1b99..6c8abb1bb9 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
@@ -1,4 +1,4 @@
-From 80e6aff72affa6d92f5abd7ff6353dfc4a7bff38 Mon Sep 17 00:00:00 2001
+From e102fbc7b9dea3e30a378964c4466f9cba7a4e9b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Aug 2016 16:44:46 +0300
 Subject: [PATCH] Do not hardocode paths to perl/python in scripts.
@@ -9,7 +9,6 @@ on targets either.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  gtkdoc-check.in    | 2 +-
  gtkdoc-depscan.in  | 2 +-
@@ -25,7 +24,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  11 files changed, 11 insertions(+), 11 deletions(-)
 
 diff --git a/gtkdoc-check.in b/gtkdoc-check.in
-index 8c8e917..f6a25f6 100755
+index d9e2ad5..9ec526d 100755
 --- a/gtkdoc-check.in
 +++ b/gtkdoc-check.in
 @@ -1,4 +1,4 @@
@@ -35,7 +34,7 @@ index 8c8e917..f6a25f6 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-depscan.in b/gtkdoc-depscan.in
-index 9bfaf30..aadc952 100755
+index c43317c..200837c 100755
 --- a/gtkdoc-depscan.in
 +++ b/gtkdoc-depscan.in
 @@ -1,4 +1,4 @@
@@ -45,7 +44,7 @@ index 9bfaf30..aadc952 100755
  from __future__ import print_function
  
 diff --git a/gtkdoc-fixxref.in b/gtkdoc-fixxref.in
-index 44f6bd1..26fbd93 100755
+index f9c4905..ed2ead1 100755
 --- a/gtkdoc-fixxref.in
 +++ b/gtkdoc-fixxref.in
 @@ -1,4 +1,4 @@
@@ -55,7 +54,7 @@ index 44f6bd1..26fbd93 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-mkdb.in b/gtkdoc-mkdb.in
-index 42d5731..3a56d56 100755
+index 641f3c4..35e95fb 100755
 --- a/gtkdoc-mkdb.in
 +++ b/gtkdoc-mkdb.in
 @@ -1,4 +1,4 @@
@@ -65,7 +64,7 @@ index 42d5731..3a56d56 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-mkhtml.in b/gtkdoc-mkhtml.in
-index 0d0a15d..914ff55 100755
+index b09f7a9..8d45966 100755
 --- a/gtkdoc-mkhtml.in
 +++ b/gtkdoc-mkhtml.in
 @@ -1,4 +1,4 @@
@@ -75,7 +74,7 @@ index 0d0a15d..914ff55 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-mkman.in b/gtkdoc-mkman.in
-index c5445cd..65db71a 100755
+index 8f7b018..9bac0b6 100755
 --- a/gtkdoc-mkman.in
 +++ b/gtkdoc-mkman.in
 @@ -1,4 +1,4 @@
@@ -85,7 +84,7 @@ index c5445cd..65db71a 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-mkpdf.in b/gtkdoc-mkpdf.in
-index e8c0c03..f807236 100755
+index 7dca4b0..808f92d 100755
 --- a/gtkdoc-mkpdf.in
 +++ b/gtkdoc-mkpdf.in
 @@ -1,4 +1,4 @@
@@ -95,7 +94,7 @@ index e8c0c03..f807236 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-rebase.in b/gtkdoc-rebase.in
-index 17a71c2..ec3fd28 100755
+index e8b0bf5..a960d8f 100755
 --- a/gtkdoc-rebase.in
 +++ b/gtkdoc-rebase.in
 @@ -1,4 +1,4 @@
@@ -105,7 +104,7 @@ index 17a71c2..ec3fd28 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-scan.in b/gtkdoc-scan.in
-index 954c811..f461504 100755
+index 7893ebc..b7eb83d 100755
 --- a/gtkdoc-scan.in
 +++ b/gtkdoc-scan.in
 @@ -1,4 +1,4 @@
@@ -115,7 +114,7 @@ index 954c811..f461504 100755
  #
  # gtk-doc - GTK DocBook documentation generator.
 diff --git a/gtkdoc-scangobj.in b/gtkdoc-scangobj.in
-index 4cbe130..52c2c24 100755
+index 7660c70..c6ff072 100755
 --- a/gtkdoc-scangobj.in
 +++ b/gtkdoc-scangobj.in
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdir-from-environment.patch b/meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdir-from-environment.patch
deleted file mode 100644
index f40124877c..0000000000
--- a/meta/recipes-gnome/gtk-doc/files/0001-Don-t-use-docdir-from-environment.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 72dfeec0e49478b0bfb471c4155044391bad8e6c Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 8 Dec 2023 10:35:25 +0000
-Subject: [PATCH] Don't use docdir from environment
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gtk-doc/-/merge_requests/73]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- buildsystems/autotools/gtkdocize.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/buildsystems/autotools/gtkdocize.in b/buildsystems/autotools/gtkdocize.in
-index 83127bf..76dcbfd 100755
---- a/buildsystems/autotools/gtkdocize.in
-+++ b/buildsystems/autotools/gtkdocize.in
-@@ -39,7 +39,7 @@ set - $args
- 
- # assume working directory if srcdir is not set
- test "$srcdir" || srcdir=.
--test "$docdir" || docdir="$srcdir"
-+docdir="$srcdir"
- 
- # detect configure script
- no_configure_found=0
diff --git a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
index 21c2db7826..8ba66542b5 100644
--- a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
+++ b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
@@ -1,23 +1,22 @@
-From 78bbf185934147a69ceb4b617d424e12e70997bf Mon Sep 17 00:00:00 2001
+From b416d65947b14dd52565beed2934a688c568daf9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 27 Jun 2017 21:00:58 +0100
-Subject: [PATCH 3/3] gtk-doc: Handle floating gtk-doc dependency
+Subject: [PATCH] gtk-doc: Handle floating gtk-doc dependency
 
 Allow the tests to be explicitly disabled to avoid floating dependnecy
 issues. This is not really an issue with RSS but is on previous releases.
 
 RP 2017/6/27
 Upstream-Status: Pending
-
 ---
  configure.ac | 10 ++++++++++
  1 file changed, 10 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 684e2d1..e5e3aab 100644
+index 0491090..4270c88 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -146,6 +146,11 @@ if test "x$GCC" = "xyes"; then
+@@ -82,6 +82,11 @@ if test "x$GCC" = "xyes"; then
  	fi
  fi
  
@@ -29,7 +28,7 @@ index 684e2d1..e5e3aab 100644
  dnl if glib is available we can enable the tests
  PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0 gobject-2.0 >= 2.6.0],
  	[	glib_prefix="`$PKG_CONFIG --variable=prefix glib-2.0`"
-@@ -156,6 +161,11 @@ PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0 gobject-2.0 >= 2.6.0],
+@@ -92,6 +97,11 @@ PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0 gobject-2.0 >= 2.6.0],
  		build_tests="no"
  	]
  )
@@ -41,6 +40,3 @@ index 684e2d1..e5e3aab 100644
  AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL" -a x$gtk_doc_use_libtool = xyes )
  dnl this enables the rule in test/Makefile.am
  AM_CONDITIONAL(BUILD_TESTS, test x$build_tests = xyes)
--- 
-2.14.1
-
diff --git a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
index d1695479dc..abe1a886fb 100644
--- a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
+++ b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
@@ -1,4 +1,4 @@
-From 8bc4c1f169f89bc5531da5b7e892b8f20e0f9a18 Mon Sep 17 00:00:00 2001
+From f2ae79077d630c4c48141d8a33409f2e88464f7a Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 21 Mar 2018 14:47:29 +0000
 Subject: [PATCH] gtk-doc: don't regenerate gtk-doc in do_install
@@ -20,16 +20,15 @@ files which don't already exist.
 
 Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=794571]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  buildsystems/autotools/gtk-doc.make | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/buildsystems/autotools/gtk-doc.make b/buildsystems/autotools/gtk-doc.make
-index 7d9a27f..8cb336d 100644
+index fb2e7e2..4f6fe2b 100644
 --- a/buildsystems/autotools/gtk-doc.make
 +++ b/buildsystems/autotools/gtk-doc.make
-@@ -111,7 +111,7 @@ setup-build.stamp:
+@@ -112,7 +112,7 @@ setup-build.stamp:
  	      destdir=`dirname $(abs_builddir)/$$file`; \
  	      test -d "$$destdir" || mkdir -p "$$destdir"; \
  	      test -f $(abs_srcdir)/$$file && \
diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index 1d260aa72b..826df82395 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,11 +1,10 @@
-From ebb0f7313a0931f646e86badce2627eff2fa37a8 Mon Sep 17 00:00:00 2001
+From 7884aaa571e6aa92a2c5bc88cc75e2d79bee2805 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  buildsystems/autotools/gtk-doc.m4 | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb
similarity index 94%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb
index 4fd5a6e925..693ae427e0 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.34.0.bb
@@ -21,12 +21,11 @@ PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_XSLTPROC=xsltproc"
 
-SRC_URI[archive.sha256sum] = "cc1b709a20eb030a278a1f9842a362e00402b7f834ae1df4c1998a723152bf43"
+SRC_URI[archive.sha256sum] = "b20b72b32a80bc18c7f975c9d4c16460c2276566a0b50f87d6852dff3aa7861c"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
            file://no-clobber.patch \
-           file://0001-Don-t-use-docdir-from-environment.patch \
            "
 SRC_URI:append:class-native = " file://pkg-config-native.patch"
 
-- 
2.42.0


--===============2936378414480301423==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk-doc-upgrade-1.33.2-1.34.0.patch"

RnJvbSBjZWEzYTRkOTI1NmIyZjZmNzliMGRiYTlkZjI2YjI0OTA3OTc0MTIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMjI6Mjg6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGstZG9jOiB1cGdyYWRlIDEuMzMuMiAtPiAxLjM0LjAKCi0tLQogLi4udC1lcnJvci1vdXQtaWYt
eHNsdHByb2MtaXMtbm90LWZvdW5kLnBhdGNoIHwgIDkgKysrLS0tLQogLi4uY29kZS1wYXRocy10
by1wZXJsLXB5dGhvbi1pbi1zY3JpcHRzLnBhdGNoIHwgMjMgKysrKysrKysrLS0tLS0tLS0tCiAu
Li4wMS1Eb24tdC11c2UtZG9jZGlyLWZyb20tZW52aXJvbm1lbnQucGF0Y2ggfCAyNCAtLS0tLS0t
LS0tLS0tLS0tLS0tCiAuLi4vZ3RrLWRvYy9maWxlcy9jb25kaXRpb25hbHRlc3RzLnBhdGNoICAg
ICAgfCAxNCArKysrLS0tLS0tLQogLi4uL2d0ay1kb2MvZmlsZXMvbm8tY2xvYmJlci5wYXRjaCAg
ICAgICAgICAgIHwgIDcgKysrLS0tCiAuLi4vZ3RrLWRvYy9maWxlcy9wa2ctY29uZmlnLW5hdGl2
ZS5wYXRjaCAgICAgfCAgMyArLS0KIC4uLi97Z3RrLWRvY18xLjMzLjIuYmIgPT4gZ3RrLWRvY18x
LjM0LjAuYmJ9ICB8ICAzICstLQogNyBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCA1
OSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ25vbWUvZ3Rr
LWRvYy9maWxlcy8wMDAxLURvbi10LXVzZS1kb2NkaXItZnJvbS1lbnZpcm9ubWVudC5wYXRjaAog
cmVuYW1lIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL3tndGstZG9jXzEuMzMuMi5iYiA9PiBn
dGstZG9jXzEuMzQuMC5iYn0gKDk0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUv
Z3RrLWRvYy9maWxlcy8wMDAxLURvLW5vdC1lcnJvci1vdXQtaWYteHNsdHByb2MtaXMtbm90LWZv
dW5kLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvMDAwMS1Eby1ub3Qt
ZXJyb3Itb3V0LWlmLXhzbHRwcm9jLWlzLW5vdC1mb3VuZC5wYXRjaAppbmRleCA5OWFlNGQ0NDE3
Li5iN2FmYTUyOGMzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxl
cy8wMDAxLURvLW5vdC1lcnJvci1vdXQtaWYteHNsdHByb2MtaXMtbm90LWZvdW5kLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzLzAwMDEtRG8tbm90LWVycm9yLW91
dC1pZi14c2x0cHJvYy1pcy1ub3QtZm91bmQucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDhi
N2ZiYmI0MDU5NTlmMjg2OGFkNmVhZGQ3ZGQwMDAxODc1OGE4YTUgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCitGcm9tIGM2MjhkZWI1ZGRhZGJiNWRkZTkyMGIwM2NiY2Y5ZTVhNGUxYzQ0NDEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5h
dmluQGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgNyBTZXAgMjAxNiAxNDo1MjowNCArMDMwMAogU3Vi
amVjdDogW1BBVENIXSBEbyBub3QgZXJyb3Igb3V0IGlmIHhzbHRwcm9jIGlzIG5vdCBmb3VuZC4K
QEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwot
aW5kZXggYjBjODhkNy4uMmE2MWQ2ZSAxMDA2NDQKK2luZGV4IDg3MjUwNzQuLjA0OTEwOTAgMTAw
NjQ0CiAtLS0gYS9jb25maWd1cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTU4LDcgKzU4
LDcgQEAgZG5sIENoZWNrIGZvciB4c2x0cHJvYworQEAgLTM3LDcgKzM3LDcgQEAgZG5sIENoZWNr
IGZvciB4c2x0cHJvYwogIGRubAogIEFDX1BBVEhfUFJPRyhbWFNMVFBST0NdLCBbeHNsdHByb2Nd
KQogIGlmIHRlc3QgLXogIiRYU0xUUFJPQyI7IHRoZW4KQEAgLTI2LDYgKzI2LDMgQEAgaW5kZXgg
YjBjODhkNy4uMmE2MWQ2ZSAxMDA2NDQKICBmaQogIAogIGRubAotLS0gCi0yLjkuMwotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy8wMDAxLURvLW5vdC1oYXJk
b2NvZGUtcGF0aHMtdG8tcGVybC1weXRob24taW4tc2NyaXB0cy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1nbm9tZS9ndGstZG9jL2ZpbGVzLzAwMDEtRG8tbm90LWhhcmRvY29kZS1wYXRocy10by1wZXJs
LXB5dGhvbi1pbi1zY3JpcHRzLnBhdGNoCmluZGV4IDE5ZTA1ZjFiOTkuLjZjOGFiYjFiYjkgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzLzAwMDEtRG8tbm90LWhh
cmRvY29kZS1wYXRocy10by1wZXJsLXB5dGhvbi1pbi1zY3JpcHRzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzLzAwMDEtRG8tbm90LWhhcmRvY29kZS1wYXRocy10
by1wZXJsLXB5dGhvbi1pbi1zY3JpcHRzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA4MGU2
YWZmNzJhZmZhNmQ5MmY1YWJkN2ZmNjM1M2RmYzRhN2JmZjM4IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSBlMTAyZmJjN2I5ZGVhM2UzMGEzNzg5NjRjNDQ2NmY5Y2JhN2E0ZTliIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDMxIEF1ZyAyMDE2IDE2OjQ0OjQ2ICswMzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIERvIG5vdCBoYXJkb2NvZGUgcGF0aHMgdG8gcGVybC9weXRob24gaW4gc2Ny
aXB0cy4KQEAgLTksNyArOSw2IEBAIG9uIHRhcmdldHMgZWl0aGVyLgogCiBVcHN0cmVhbS1TdGF0
dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgZ3RrZG9jLWNo
ZWNrLmluICAgIHwgMiArLQogIGd0a2RvYy1kZXBzY2FuLmluICB8IDIgKy0KQEAgLTI1LDcgKzI0
LDcgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+CiAgMTEgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9ndGtkb2MtY2hlY2suaW4gYi9ndGtkb2MtY2hlY2suaW4KLWlu
ZGV4IDhjOGU5MTcuLmY2YTI1ZjYgMTAwNzU1CitpbmRleCBkOWUyYWQ1Li45ZWM1MjZkIDEwMDc1
NQogLS0tIGEvZ3RrZG9jLWNoZWNrLmluCiArKysgYi9ndGtkb2MtY2hlY2suaW4KIEBAIC0xLDQg
KzEsNCBAQApAQCAtMzUsNyArMzQsNyBAQCBpbmRleCA4YzhlOTE3Li5mNmEyNWY2IDEwMDc1NQog
ICMKICAjIGd0ay1kb2MgLSBHVEsgRG9jQm9vayBkb2N1bWVudGF0aW9uIGdlbmVyYXRvci4KIGRp
ZmYgLS1naXQgYS9ndGtkb2MtZGVwc2Nhbi5pbiBiL2d0a2RvYy1kZXBzY2FuLmluCi1pbmRleCA5
YmZhZjMwLi5hYWRjOTUyIDEwMDc1NQoraW5kZXggYzQzMzE3Yy4uMjAwODM3YyAxMDA3NTUKIC0t
LSBhL2d0a2RvYy1kZXBzY2FuLmluCiArKysgYi9ndGtkb2MtZGVwc2Nhbi5pbgogQEAgLTEsNCAr
MSw0IEBACkBAIC00NSw3ICs0NCw3IEBAIGluZGV4IDliZmFmMzAuLmFhZGM5NTIgMTAwNzU1CiAg
ZnJvbSBfX2Z1dHVyZV9fIGltcG9ydCBwcmludF9mdW5jdGlvbgogIAogZGlmZiAtLWdpdCBhL2d0
a2RvYy1maXh4cmVmLmluIGIvZ3RrZG9jLWZpeHhyZWYuaW4KLWluZGV4IDQ0ZjZiZDEuLjI2ZmJk
OTMgMTAwNzU1CitpbmRleCBmOWM0OTA1Li5lZDJlYWQxIDEwMDc1NQogLS0tIGEvZ3RrZG9jLWZp
eHhyZWYuaW4KICsrKyBiL2d0a2RvYy1maXh4cmVmLmluCiBAQCAtMSw0ICsxLDQgQEAKQEAgLTU1
LDcgKzU0LDcgQEAgaW5kZXggNDRmNmJkMS4uMjZmYmQ5MyAxMDA3NTUKICAjCiAgIyBndGstZG9j
IC0gR1RLIERvY0Jvb2sgZG9jdW1lbnRhdGlvbiBnZW5lcmF0b3IuCiBkaWZmIC0tZ2l0IGEvZ3Rr
ZG9jLW1rZGIuaW4gYi9ndGtkb2MtbWtkYi5pbgotaW5kZXggNDJkNTczMS4uM2E1NmQ1NiAxMDA3
NTUKK2luZGV4IDY0MWYzYzQuLjM1ZTk1ZmIgMTAwNzU1CiAtLS0gYS9ndGtkb2MtbWtkYi5pbgog
KysrIGIvZ3RrZG9jLW1rZGIuaW4KIEBAIC0xLDQgKzEsNCBAQApAQCAtNjUsNyArNjQsNyBAQCBp
bmRleCA0MmQ1NzMxLi4zYTU2ZDU2IDEwMDc1NQogICMKICAjIGd0ay1kb2MgLSBHVEsgRG9jQm9v
ayBkb2N1bWVudGF0aW9uIGdlbmVyYXRvci4KIGRpZmYgLS1naXQgYS9ndGtkb2MtbWtodG1sLmlu
IGIvZ3RrZG9jLW1raHRtbC5pbgotaW5kZXggMGQwYTE1ZC4uOTE0ZmY1NSAxMDA3NTUKK2luZGV4
IGIwOWY3YTkuLjhkNDU5NjYgMTAwNzU1CiAtLS0gYS9ndGtkb2MtbWtodG1sLmluCiArKysgYi9n
dGtkb2MtbWtodG1sLmluCiBAQCAtMSw0ICsxLDQgQEAKQEAgLTc1LDcgKzc0LDcgQEAgaW5kZXgg
MGQwYTE1ZC4uOTE0ZmY1NSAxMDA3NTUKICAjCiAgIyBndGstZG9jIC0gR1RLIERvY0Jvb2sgZG9j
dW1lbnRhdGlvbiBnZW5lcmF0b3IuCiBkaWZmIC0tZ2l0IGEvZ3RrZG9jLW1rbWFuLmluIGIvZ3Rr
ZG9jLW1rbWFuLmluCi1pbmRleCBjNTQ0NWNkLi42NWRiNzFhIDEwMDc1NQoraW5kZXggOGY3YjAx
OC4uOWJhYzBiNiAxMDA3NTUKIC0tLSBhL2d0a2RvYy1ta21hbi5pbgogKysrIGIvZ3RrZG9jLW1r
bWFuLmluCiBAQCAtMSw0ICsxLDQgQEAKQEAgLTg1LDcgKzg0LDcgQEAgaW5kZXggYzU0NDVjZC4u
NjVkYjcxYSAxMDA3NTUKICAjCiAgIyBndGstZG9jIC0gR1RLIERvY0Jvb2sgZG9jdW1lbnRhdGlv
biBnZW5lcmF0b3IuCiBkaWZmIC0tZ2l0IGEvZ3RrZG9jLW1rcGRmLmluIGIvZ3RrZG9jLW1rcGRm
LmluCi1pbmRleCBlOGMwYzAzLi5mODA3MjM2IDEwMDc1NQoraW5kZXggN2RjYTRiMC4uODA4Zjky
ZCAxMDA3NTUKIC0tLSBhL2d0a2RvYy1ta3BkZi5pbgogKysrIGIvZ3RrZG9jLW1rcGRmLmluCiBA
QCAtMSw0ICsxLDQgQEAKQEAgLTk1LDcgKzk0LDcgQEAgaW5kZXggZThjMGMwMy4uZjgwNzIzNiAx
MDA3NTUKICAjCiAgIyBndGstZG9jIC0gR1RLIERvY0Jvb2sgZG9jdW1lbnRhdGlvbiBnZW5lcmF0
b3IuCiBkaWZmIC0tZ2l0IGEvZ3RrZG9jLXJlYmFzZS5pbiBiL2d0a2RvYy1yZWJhc2UuaW4KLWlu
ZGV4IDE3YTcxYzIuLmVjM2ZkMjggMTAwNzU1CitpbmRleCBlOGIwYmY1Li5hOTYwZDhmIDEwMDc1
NQogLS0tIGEvZ3RrZG9jLXJlYmFzZS5pbgogKysrIGIvZ3RrZG9jLXJlYmFzZS5pbgogQEAgLTEs
NCArMSw0IEBACkBAIC0xMDUsNyArMTA0LDcgQEAgaW5kZXggMTdhNzFjMi4uZWMzZmQyOCAxMDA3
NTUKICAjCiAgIyBndGstZG9jIC0gR1RLIERvY0Jvb2sgZG9jdW1lbnRhdGlvbiBnZW5lcmF0b3Iu
CiBkaWZmIC0tZ2l0IGEvZ3RrZG9jLXNjYW4uaW4gYi9ndGtkb2Mtc2Nhbi5pbgotaW5kZXggOTU0
YzgxMS4uZjQ2MTUwNCAxMDA3NTUKK2luZGV4IDc4OTNlYmMuLmI3ZWI4M2QgMTAwNzU1CiAtLS0g
YS9ndGtkb2Mtc2Nhbi5pbgogKysrIGIvZ3RrZG9jLXNjYW4uaW4KIEBAIC0xLDQgKzEsNCBAQApA
QCAtMTE1LDcgKzExNCw3IEBAIGluZGV4IDk1NGM4MTEuLmY0NjE1MDQgMTAwNzU1CiAgIwogICMg
Z3RrLWRvYyAtIEdUSyBEb2NCb29rIGRvY3VtZW50YXRpb24gZ2VuZXJhdG9yLgogZGlmZiAtLWdp
dCBhL2d0a2RvYy1zY2FuZ29iai5pbiBiL2d0a2RvYy1zY2FuZ29iai5pbgotaW5kZXggNGNiZTEz
MC4uNTJjMmMyNCAxMDA3NTUKK2luZGV4IDc2NjBjNzAuLmM2ZmYwNzIgMTAwNzU1CiAtLS0gYS9n
dGtkb2Mtc2NhbmdvYmouaW4KICsrKyBiL2d0a2RvYy1zY2FuZ29iai5pbgogQEAgLTEsNCArMSw0
IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy8wMDAxLURv
bi10LXVzZS1kb2NkaXItZnJvbS1lbnZpcm9ubWVudC5wYXRjaCBiL21ldGEvcmVjaXBlcy1nbm9t
ZS9ndGstZG9jL2ZpbGVzLzAwMDEtRG9uLXQtdXNlLWRvY2Rpci1mcm9tLWVudmlyb25tZW50LnBh
dGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmNDAxMjQ4NzdjLi4wMDAwMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzLzAwMDEtRG9uLXQtdXNlLWRv
Y2Rpci1mcm9tLWVudmlyb25tZW50LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjQgKzAsMCBA
QAotRnJvbSA3MmRmZWVjMGU0OTQ3OGIwYmZiNDcxYzQxNTUwNDQzOTFiYWQ4ZTZjIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQotRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+
Ci1EYXRlOiBGcmksIDggRGVjIDIwMjMgMTA6MzU6MjUgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSF0g
RG9uJ3QgdXNlIGRvY2RpciBmcm9tIGVudmlyb25tZW50Ci0KLVVwc3RyZWFtLVN0YXR1czogU3Vi
bWl0dGVkIFtodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvZ3RrLWRvYy8tL21lcmdlX3Jl
cXVlc3RzLzczXQotU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5j
b20+Ci0tLS0KLSBidWlsZHN5c3RlbXMvYXV0b3Rvb2xzL2d0a2RvY2l6ZS5pbiB8IDIgKy0KLSAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdp
dCBhL2J1aWxkc3lzdGVtcy9hdXRvdG9vbHMvZ3RrZG9jaXplLmluIGIvYnVpbGRzeXN0ZW1zL2F1
dG90b29scy9ndGtkb2NpemUuaW4KLWluZGV4IDgzMTI3YmYuLjc2ZGNiZmQgMTAwNzU1Ci0tLS0g
YS9idWlsZHN5c3RlbXMvYXV0b3Rvb2xzL2d0a2RvY2l6ZS5pbgotKysrIGIvYnVpbGRzeXN0ZW1z
L2F1dG90b29scy9ndGtkb2NpemUuaW4KLUBAIC0zOSw3ICszOSw3IEBAIHNldCAtICRhcmdzCi0g
Ci0gIyBhc3N1bWUgd29ya2luZyBkaXJlY3RvcnkgaWYgc3JjZGlyIGlzIG5vdCBzZXQKLSB0ZXN0
ICIkc3JjZGlyIiB8fCBzcmNkaXI9LgotLXRlc3QgIiRkb2NkaXIiIHx8IGRvY2Rpcj0iJHNyY2Rp
ciIKLStkb2NkaXI9IiRzcmNkaXIiCi0gCi0gIyBkZXRlY3QgY29uZmlndXJlIHNjcmlwdAotIG5v
X2NvbmZpZ3VyZV9mb3VuZD0wCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRv
Yy9maWxlcy9jb25kaXRpb25hbHRlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1k
b2MvZmlsZXMvY29uZGl0aW9uYWx0ZXN0cy5wYXRjaAppbmRleCAyMWMyZGI3ODI2Li44YmE2NjU0
MmI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9jb25kaXRp
b25hbHRlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzL2Nv
bmRpdGlvbmFsdGVzdHMucGF0Y2gKQEAgLTEsMjMgKzEsMjIgQEAKLUZyb20gNzhiYmYxODU5MzQx
NDdhNjljZWI0YjYxN2Q0MjRlMTJlNzA5OTdiZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gYjQxNmQ2NTk0N2IxNGRkNTI1NjViZWVkMjkzNGE2ODhjNTY4ZGFmOSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZv
dW5kYXRpb24ub3JnPgogRGF0ZTogVHVlLCAyNyBKdW4gMjAxNyAyMTowMDo1OCArMDEwMAotU3Vi
amVjdDogW1BBVENIIDMvM10gZ3RrLWRvYzogSGFuZGxlIGZsb2F0aW5nIGd0ay1kb2MgZGVwZW5k
ZW5jeQorU3ViamVjdDogW1BBVENIXSBndGstZG9jOiBIYW5kbGUgZmxvYXRpbmcgZ3RrLWRvYyBk
ZXBlbmRlbmN5CiAKIEFsbG93IHRoZSB0ZXN0cyB0byBiZSBleHBsaWNpdGx5IGRpc2FibGVkIHRv
IGF2b2lkIGZsb2F0aW5nIGRlcGVuZG5lY3kKIGlzc3Vlcy4gVGhpcyBpcyBub3QgcmVhbGx5IGFu
IGlzc3VlIHdpdGggUlNTIGJ1dCBpcyBvbiBwcmV2aW91cyByZWxlYXNlcy4KIAogUlAgMjAxNy82
LzI3CiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKLQogLS0tCiAgY29uZmlndXJlLmFjIHwgMTAg
KysrKysrKysrKwogIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1n
aXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4IDY4NGUyZDEuLmU1ZTNhYWIg
MTAwNjQ0CitpbmRleCAwNDkxMDkwLi40MjcwYzg4IDEwMDY0NAogLS0tIGEvY29uZmlndXJlLmFj
CiArKysgYi9jb25maWd1cmUuYWMKLUBAIC0xNDYsNiArMTQ2LDExIEBAIGlmIHRlc3QgIngkR0ND
IiA9ICJ4eWVzIjsgdGhlbgorQEAgLTgyLDYgKzgyLDExIEBAIGlmIHRlc3QgIngkR0NDIiA9ICJ4
eWVzIjsgdGhlbgogIAlmaQogIGZpCiAgCkBAIC0yOSw3ICsyOCw3IEBAIGluZGV4IDY4NGUyZDEu
LmU1ZTNhYWIgMTAwNjQ0CiAgZG5sIGlmIGdsaWIgaXMgYXZhaWxhYmxlIHdlIGNhbiBlbmFibGUg
dGhlIHRlc3RzCiAgUEtHX0NIRUNLX01PRFVMRVMoVEVTVF9ERVBTLCBbZ2xpYi0yLjAgPj0gMi42
LjAgZ29iamVjdC0yLjAgPj0gMi42LjBdLAogIAlbCWdsaWJfcHJlZml4PSJgJFBLR19DT05GSUcg
LS12YXJpYWJsZT1wcmVmaXggZ2xpYi0yLjBgIgotQEAgLTE1Niw2ICsxNjEsMTEgQEAgUEtHX0NI
RUNLX01PRFVMRVMoVEVTVF9ERVBTLCBbZ2xpYi0yLjAgPj0gMi42LjAgZ29iamVjdC0yLjAgPj0g
Mi42LjBdLAorQEAgLTkyLDYgKzk3LDExIEBAIFBLR19DSEVDS19NT0RVTEVTKFRFU1RfREVQUywg
W2dsaWItMi4wID49IDIuNi4wIGdvYmplY3QtMi4wID49IDIuNi4wXSwKICAJCWJ1aWxkX3Rlc3Rz
PSJubyIKICAJXQogICkKQEAgLTQxLDYgKzQwLDMgQEAgaW5kZXggNjg0ZTJkMS4uZTVlM2FhYiAx
MDA2NDQKICBBTV9DT05ESVRJT05BTChHVEtfRE9DX1VTRV9MSUJUT09MLCB0ZXN0IC1uICIkTElC
VE9PTCIgLWEgeCRndGtfZG9jX3VzZV9saWJ0b29sID0geHllcyApCiAgZG5sIHRoaXMgZW5hYmxl
cyB0aGUgcnVsZSBpbiB0ZXN0L01ha2VmaWxlLmFtCiAgQU1fQ09ORElUSU9OQUwoQlVJTERfVEVT
VFMsIHRlc3QgeCRidWlsZF90ZXN0cyA9IHh5ZXMpCi0tLSAKLTIuMTQuMQotCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9uby1jbG9iYmVyLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvbm8tY2xvYmJlci5wYXRjaAppbmRleCBkMTY5
NTQ3OWRjLi5hYmUxYTg4NmZiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRv
Yy9maWxlcy9uby1jbG9iYmVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9j
L2ZpbGVzL25vLWNsb2JiZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDhiYzRjMWYxNjlm
ODliYzU1MzFkYTViN2U4OTJiOGYyMGUwZjlhMTggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGYyYWU3OTA3N2Q2MzBjNGM0ODE0MWQ4YTMzNDA5ZjJlODg0NjRmN2EgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwuY29tPgog
RGF0ZTogV2VkLCAyMSBNYXIgMjAxOCAxNDo0NzoyOSArMDAwMAogU3ViamVjdDogW1BBVENIXSBn
dGstZG9jOiBkb24ndCByZWdlbmVyYXRlIGd0ay1kb2MgaW4gZG9faW5zdGFsbApAQCAtMjAsMTYg
KzIwLDE1IEBAIGZpbGVzIHdoaWNoIGRvbid0IGFscmVhZHkgZXhpc3QuCiAKIFVwc3RyZWFtLVN0
YXR1czogU3VibWl0dGVkIFtodHRwczovL2J1Z3ppbGxhLmdub21lLm9yZy9zaG93X2J1Zy5jZ2k/
aWQ9Nzk0NTcxXQogU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVs
LmNvbT4KLQogLS0tCiAgYnVpbGRzeXN0ZW1zL2F1dG90b29scy9ndGstZG9jLm1ha2UgfCAyICst
CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYg
LS1naXQgYS9idWlsZHN5c3RlbXMvYXV0b3Rvb2xzL2d0ay1kb2MubWFrZSBiL2J1aWxkc3lzdGVt
cy9hdXRvdG9vbHMvZ3RrLWRvYy5tYWtlCi1pbmRleCA3ZDlhMjdmLi44Y2IzMzZkIDEwMDY0NAor
aW5kZXggZmIyZTdlMi4uNGY2ZmUyYiAxMDA2NDQKIC0tLSBhL2J1aWxkc3lzdGVtcy9hdXRvdG9v
bHMvZ3RrLWRvYy5tYWtlCiArKysgYi9idWlsZHN5c3RlbXMvYXV0b3Rvb2xzL2d0ay1kb2MubWFr
ZQotQEAgLTExMSw3ICsxMTEsNyBAQCBzZXR1cC1idWlsZC5zdGFtcDoKK0BAIC0xMTIsNyArMTEy
LDcgQEAgc2V0dXAtYnVpbGQuc3RhbXA6CiAgCSAgICAgIGRlc3RkaXI9YGRpcm5hbWUgJChhYnNf
YnVpbGRkaXIpLyQkZmlsZWA7IFwKICAJICAgICAgdGVzdCAtZCAiJCRkZXN0ZGlyIiB8fCBta2Rp
ciAtcCAiJCRkZXN0ZGlyIjsgXAogIAkgICAgICB0ZXN0IC1mICQoYWJzX3NyY2RpcikvJCRmaWxl
ICYmIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzL3BrZy1j
b25maWctbmF0aXZlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvcGtn
LWNvbmZpZy1uYXRpdmUucGF0Y2gKaW5kZXggMWQyNjBhYTcyYi4uODI2ZGY4MjM5NSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvcGtnLWNvbmZpZy1uYXRpdmUu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvcGtnLWNvbmZpZy1u
YXRpdmUucGF0Y2gKQEAgLTEsMTEgKzEsMTAgQEAKLUZyb20gZWJiMGY3MzEzYTA5MzFmNjQ2ZTg2
YmFkY2UyNjI3ZWZmMmZhMzdhOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzg4NGFh
YTU3MWU2YWE5MmEyYzViYzg4Y2M3NWUyZDc5YmVlMjgwNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBEYXRlOiBNb24s
IDUgU2VwIDIwMTYgMjI6MjU6NDQgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gVXNlIG5hdGl2ZSBw
a2ctY29uZmlnIHdoZW4gbG9va2luZyBmb3IgZ3RrLWRvYy4KIAogVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50
ZWwuY29tPgotCiAtLS0KICBidWlsZHN5c3RlbXMvYXV0b3Rvb2xzL2d0ay1kb2MubTQgfCA3ICsr
KysrKy0KICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9ndGstZG9jXzEuMzMuMi5iYiBi
L21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2d0ay1kb2NfMS4zNC4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2d0ay1kb2Nf
MS4zMy4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9ndGstZG9jXzEu
MzQuMC5iYgppbmRleCA0ZmQ1YTZlOTI1Li42OTNhZTQyN2UwIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZ3RrLWRvYy9ndGstZG9jXzEuMzMuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMt
Z25vbWUvZ3RrLWRvYy9ndGstZG9jXzEuMzQuMC5iYgpAQCAtMjEsMTIgKzIxLDExIEBAIFBBQ0tB
R0VDT05GSUdbdGVzdHNdID0gIi0tZW5hYmxlLXRlc3RzLC0tZGlzYWJsZS10ZXN0cyxnbGliLTIu
MCIKIAogQ0FDSEVEX0NPTkZJR1VSRVZBUlMgKz0gImFjX2N2X3BhdGhfWFNMVFBST0M9eHNsdHBy
b2MiCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImNjMWI3MDlhMjBlYjAzMGEyNzhh
MWY5ODQyYTM2MmUwMDQwMmI3ZjgzNGFlMWRmNGMxOTk4YTcyMzE1MmJmNDMiCitTUkNfVVJJW2Fy
Y2hpdmUuc2hhMjU2c3VtXSA9ICJiMjBiNzJiMzJhODBiYzE4YzdmOTc1YzlkNGMxNjQ2MGMyMjc2
NTY2YTBiNTBmODdkNjg1MmRmZjNhYTc4NjFjIgogU1JDX1VSSSArPSAiZmlsZTovLzAwMDEtRG8t
bm90LWhhcmRvY29kZS1wYXRocy10by1wZXJsLXB5dGhvbi1pbi1zY3JpcHRzLnBhdGNoIFwKICAg
ICAgICAgICAgZmlsZTovLzAwMDEtRG8tbm90LWVycm9yLW91dC1pZi14c2x0cHJvYy1pcy1ub3Qt
Zm91bmQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vY29uZGl0aW9uYWx0ZXN0cy5wYXRjaCBc
CiAgICAgICAgICAgIGZpbGU6Ly9uby1jbG9iYmVyLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTov
LzAwMDEtRG9uLXQtdXNlLWRvY2Rpci1mcm9tLWVudmlyb25tZW50LnBhdGNoIFwKICAgICAgICAg
ICAgIgogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vcGtnLWNvbmZpZy1u
YXRpdmUucGF0Y2giCiAKLS0gCjIuNDIuMAoK

--===============2936378414480301423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/binutils-cross-x86_64 (sysroot):
  /sysroot-providers/virtual_x86_64-poky-linux-binutils was added
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-addr2line was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-as was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++filt was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-dwp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-elfedit was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gprof was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.bfd was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.gold was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objcopy was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objdump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-readelf was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-size was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strings was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/libdep.so was added
  /usr/lib/x86_64-poky-linux/ldscripts was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/stamp was added
  /sysroot-providers/virtual_x86_64-poky-linux-musl-binutils was removed
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-addr2line was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-as was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++filt was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-dwp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-elfedit was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gprof was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.gold was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objcopy was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objdump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-readelf was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-size was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strings was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/libdep.so was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/stamp was removed

--===============2936378414480301423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gtk-doc/gtk-doc-dbg: PV changed from "1.33.2" to "1.34.0"
packages/core2-64-poky-linux/gtk-doc/gtk-doc-dbg: PKGV changed from 1.33.2 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/gtk-doc/gtk-doc-dev: PV changed from "1.33.2" to "1.34.0"
packages/core2-64-poky-linux/gtk-doc/gtk-doc-dev: PKGV changed from 1.33.2 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/gtk-doc/gtk-doc-doc: PV changed from "1.33.2" to "1.34.0"
packages/core2-64-poky-linux/gtk-doc/gtk-doc-doc: PKGV changed from 1.33.2 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/gtk-doc/gtk-doc-locale: PV changed from "1.33.2" to "1.34.0"
packages/core2-64-poky-linux/gtk-doc/gtk-doc-locale: PKGV changed from 1.33.2 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/gtk-doc/gtk-doc-src: PV changed from "1.33.2" to "1.34.0"
packages/core2-64-poky-linux/gtk-doc/gtk-doc-src: PKGV changed from 1.33.2 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/gtk-doc/gtk-doc-staticdev: PV changed from "1.33.2" to "1.34.0"
packages/core2-64-poky-linux/gtk-doc/gtk-doc-staticdev: PKGV changed from 1.33.2 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/gtk-doc/gtk-doc: PV changed from "1.33.2" to "1.34.0"
packages/core2-64-poky-linux/gtk-doc/gtk-doc: PKGSIZE changed from 566403 to 566546 (+0%)
packages/core2-64-poky-linux/gtk-doc/gtk-doc: PKGV changed from 1.33.2 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/gtk-doc: PV changed from "1.33.2" to "1.34.0"
packages/core2-64-poky-linux/gtk-doc: PKGV changed from 1.33.2 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/gtk-doc: SRC_URI changed from "https://download.gnome.org/sources//gtk-doc/1.33/gtk-doc-1.33.2.tar.xz;name=archive file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch file://conditionaltests.patch file://no-clobber.patch file://0001-Don-t-use-docdir-from-environment.patch" to "https://download.gnome.org/sources//gtk-doc/1.34/gtk-doc-1.34.0.tar.xz;name=archive file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch file://conditionaltests.patch file://no-clobber.patch"
Changes to packages/x86_64-linux/binutils-cross-x86_64 (sysroot):
  /sysroot-providers/virtual_x86_64-poky-linux-binutils was added
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-addr2line was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-as was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++filt was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-dwp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-elfedit was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gprof was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.bfd was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ld.gold was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objcopy was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-objdump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-readelf was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-size was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strings was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/libdep.so was added
  /usr/lib/x86_64-poky-linux/ldscripts was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf32_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_i386.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_iamcu.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xd was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xde was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xdwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xs was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsc was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsce was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xse was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xsw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xswe was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xw was added
  /usr/lib/x86_64-poky-linux/ldscripts/elf_x86_64.xwe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pep.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.x was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xa was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xbn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xe was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xn was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xr was added
  /usr/lib/x86_64-poky-linux/ldscripts/i386pe.xu was added
  /usr/lib/x86_64-poky-linux/ldscripts/stamp was added
  /sysroot-providers/virtual_x86_64-poky-linux-musl-binutils was removed
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-addr2line was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-as was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++filt was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-dwp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-elfedit was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gprof was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ld.gold was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objcopy was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-objdump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-readelf was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-size was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strings was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/libdep.so was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf32_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_i386.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_iamcu.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xd was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xde was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xdwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xs was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsc was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsce was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xse was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xsw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xswe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xw was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/elf_x86_64.xwe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pep.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.x was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xa was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xbn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xe was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xn was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xr was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/i386pe.xu was removed
  /usr/lib/x86_64-poky-linux-musl/ldscripts/stamp was removed

--===============2936378414480301423==--

