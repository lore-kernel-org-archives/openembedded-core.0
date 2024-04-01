Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707E0CD12B2
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:28 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2018.1711994602980176954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WWWDsLcu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=M/Z72V2z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9ad4837c-6af763bd-e7e4-4a3a-83eb-163e74b9d1b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GUOJEaMFA6hH0p0NkYmpyMfPLquvxyzPCClN61+mijk=;
	b=WWWDsLcuvabRYwdUrY1/9BSv4OQO0YYYGAQtMv/Ptyh8t+a7XVZXWYqtp6FcpCQ+
	oZk3NtQ/L/i4XIbmrTIKJGR6z+N4FjkQzc7Zk3EZwEm1kbR8ZBxqf61/fxaTXV+6+6s
	ZH47JBakR5EpIHje7afg9chjVg73XgHXByP35pO8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GUOJEaMFA6hH0p0NkYmpyMfPLquvxyzPCClN61+mijk=;
	b=M/Z72V2zVyJQWOj92+RWWzJ0wmy76gcH9D7nG/QwdEA3lbHUxe3nJ8s7XZovm08x
	8T1j50oTV3QeZzOJ0G1gNlUCBonXOzLWK05KC5y71rZ3p0MLhk6PkySTnzOTd5qCdqQ
	G9B09+Dmk7YfkN6c36tsWbtTB+HqB49EGBBnSXpk=
Content-Type: multipart/mixed; boundary="===============0584036978680576745=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk-doc: upgrading to 1.34.0 SUCCEEDED
Message-ID: <0101018e9ad4837c-6af763bd-e7e4-4a3a-83eb-163e74b9d1b8-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197785

--===============0584036978680576745==
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
From a99a2d27d9e57d644b34577b78e6b81bea64829a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 12:40:29 +0000
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
index 99ae4d4417..fe3311c845 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
@@ -1,4 +1,4 @@
-From 8b7fbbb405959f2868ad6eadd7dd00018758a8a5 Mon Sep 17 00:00:00 2001
+From f8cb120d5fbfb449dd9ee6c6266b0c19cbcfaab7 Mon Sep 17 00:00:00 2001
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
index 19e05f1b99..8380fd88df 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
@@ -1,4 +1,4 @@
-From 80e6aff72affa6d92f5abd7ff6353dfc4a7bff38 Mon Sep 17 00:00:00 2001
+From 084a1d8320938bbcd05cff67722376fe1feef5e5 Mon Sep 17 00:00:00 2001
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
index 21c2db7826..b0a38fedd9 100644
--- a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
+++ b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
@@ -1,23 +1,22 @@
-From 78bbf185934147a69ceb4b617d424e12e70997bf Mon Sep 17 00:00:00 2001
+From 02f1355d9d2b1fadae7a5a378fd33bd8aa1bbdf8 Mon Sep 17 00:00:00 2001
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
index d1695479dc..4732b8a565 100644
--- a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
+++ b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
@@ -1,4 +1,4 @@
-From 8bc4c1f169f89bc5531da5b7e892b8f20e0f9a18 Mon Sep 17 00:00:00 2001
+From 53b77d2e19f6762a21a27451276bb634e4bf7104 Mon Sep 17 00:00:00 2001
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
index 1d260aa72b..bd14d765e5 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,11 +1,10 @@
-From ebb0f7313a0931f646e86badce2627eff2fa37a8 Mon Sep 17 00:00:00 2001
+From f5dc3e7ab3d7490396a18655c115c15e201b3811 Mon Sep 17 00:00:00 2001
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


--===============0584036978680576745==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk-doc-upgrade-1.33.2-1.34.0.patch"

RnJvbSBhOTlhMmQyN2Q5ZTU3ZDY0NGIzNDU3N2I3OGU2YjgxYmVhNjQ4MjlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMjo0MDoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
ay1kb2M6IHVwZ3JhZGUgMS4zMy4yIC0+IDEuMzQuMAoKLS0tCiAuLi50LWVycm9yLW91dC1pZi14
c2x0cHJvYy1pcy1ub3QtZm91bmQucGF0Y2ggfCAgOSArKystLS0tCiAuLi5jb2RlLXBhdGhzLXRv
LXBlcmwtcHl0aG9uLWluLXNjcmlwdHMucGF0Y2ggfCAyMyArKysrKysrKystLS0tLS0tLS0KIC4u
LjAxLURvbi10LXVzZS1kb2NkaXItZnJvbS1lbnZpcm9ubWVudC5wYXRjaCB8IDI0IC0tLS0tLS0t
LS0tLS0tLS0tLS0KIC4uLi9ndGstZG9jL2ZpbGVzL2NvbmRpdGlvbmFsdGVzdHMucGF0Y2ggICAg
ICB8IDE0ICsrKystLS0tLS0tCiAuLi4vZ3RrLWRvYy9maWxlcy9uby1jbG9iYmVyLnBhdGNoICAg
ICAgICAgICAgfCAgNyArKystLS0KIC4uLi9ndGstZG9jL2ZpbGVzL3BrZy1jb25maWctbmF0aXZl
LnBhdGNoICAgICB8ICAzICstLQogLi4uL3tndGstZG9jXzEuMzMuMi5iYiA9PiBndGstZG9jXzEu
MzQuMC5iYn0gIHwgIDMgKy0tCiA3IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDU5
IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1nbm9tZS9ndGst
ZG9jL2ZpbGVzLzAwMDEtRG9uLXQtdXNlLWRvY2Rpci1mcm9tLWVudmlyb25tZW50LnBhdGNoCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2Mve2d0ay1kb2NfMS4zMy4yLmJiID0+IGd0
ay1kb2NfMS4zNC4wLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9n
dGstZG9jL2ZpbGVzLzAwMDEtRG8tbm90LWVycm9yLW91dC1pZi14c2x0cHJvYy1pcy1ub3QtZm91
bmQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy8wMDAxLURvLW5vdC1l
cnJvci1vdXQtaWYteHNsdHByb2MtaXMtbm90LWZvdW5kLnBhdGNoCmluZGV4IDk5YWU0ZDQ0MTcu
LmZlMzMxMWM4NDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVz
LzAwMDEtRG8tbm90LWVycm9yLW91dC1pZi14c2x0cHJvYy1pcy1ub3QtZm91bmQucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvMDAwMS1Eby1ub3QtZXJyb3Itb3V0
LWlmLXhzbHRwcm9jLWlzLW5vdC1mb3VuZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGI3
ZmJiYjQwNTk1OWYyODY4YWQ2ZWFkZDdkZDAwMDE4NzU4YThhNSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gZjhjYjEyMGQ1ZmJmYjQ0OWRkOWVlNmM2MjY2YjBjMTljYmNmYWFiNyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPgogRGF0ZTogV2VkLCA3IFNlcCAyMDE2IDE0OjUyOjA0ICswMzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIERvIG5vdCBlcnJvciBvdXQgaWYgeHNsdHByb2MgaXMgbm90IGZvdW5kLgpA
QCAtMTQsMTAgKzE0LDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1p
bmRleCBiMGM4OGQ3Li4yYTYxZDZlIDEwMDY0NAoraW5kZXggODcyNTA3NC4uMDQ5MTA5MCAxMDA2
NDQKIC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCi1AQCAtNTgsNyArNTgs
NyBAQCBkbmwgQ2hlY2sgZm9yIHhzbHRwcm9jCitAQCAtMzcsNyArMzcsNyBAQCBkbmwgQ2hlY2sg
Zm9yIHhzbHRwcm9jCiAgZG5sCiAgQUNfUEFUSF9QUk9HKFtYU0xUUFJPQ10sIFt4c2x0cHJvY10p
CiAgaWYgdGVzdCAteiAiJFhTTFRQUk9DIjsgdGhlbgpAQCAtMjYsNiArMjYsMyBAQCBpbmRleCBi
MGM4OGQ3Li4yYTYxZDZlIDEwMDY0NAogIGZpCiAgCiAgZG5sCi0tLSAKLTIuOS4zCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzLzAwMDEtRG8tbm90LWhhcmRv
Y29kZS1wYXRocy10by1wZXJsLXB5dGhvbi1pbi1zY3JpcHRzLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWdub21lL2d0ay1kb2MvZmlsZXMvMDAwMS1Eby1ub3QtaGFyZG9jb2RlLXBhdGhzLXRvLXBlcmwt
cHl0aG9uLWluLXNjcmlwdHMucGF0Y2gKaW5kZXggMTllMDVmMWI5OS4uODM4MGZkODhkZiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvMDAwMS1Eby1ub3QtaGFy
ZG9jb2RlLXBhdGhzLXRvLXBlcmwtcHl0aG9uLWluLXNjcmlwdHMucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvMDAwMS1Eby1ub3QtaGFyZG9jb2RlLXBhdGhzLXRv
LXBlcmwtcHl0aG9uLWluLXNjcmlwdHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDgwZTZh
ZmY3MmFmZmE2ZDkyZjVhYmQ3ZmY2MzUzZGZjNGE3YmZmMzggTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDA4NGExZDgzMjA5MzhiYmNkMDVjZmY2NzcyMjM3NmZlMWZlZWY1ZTUgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4KIERhdGU6IFdlZCwgMzEgQXVnIDIwMTYgMTY6NDQ6NDYgKzAzMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gRG8gbm90IGhhcmRvY29kZSBwYXRocyB0byBwZXJsL3B5dGhvbiBpbiBzY3Jp
cHRzLgpAQCAtOSw3ICs5LDYgQEAgb24gdGFyZ2V0cyBlaXRoZXIuCiAKIFVwc3RyZWFtLVN0YXR1
czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgotCiAtLS0KICBndGtkb2MtY2hl
Y2suaW4gICAgfCAyICstCiAgZ3RrZG9jLWRlcHNjYW4uaW4gIHwgMiArLQpAQCAtMjUsNyArMjQs
NyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWls
LmNvbT4KICAxMSBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkKIAogZGlmZiAtLWdpdCBhL2d0a2RvYy1jaGVjay5pbiBiL2d0a2RvYy1jaGVjay5pbgotaW5k
ZXggOGM4ZTkxNy4uZjZhMjVmNiAxMDA3NTUKK2luZGV4IGQ5ZTJhZDUuLjllYzUyNmQgMTAwNzU1
CiAtLS0gYS9ndGtkb2MtY2hlY2suaW4KICsrKyBiL2d0a2RvYy1jaGVjay5pbgogQEAgLTEsNCAr
MSw0IEBACkBAIC0zNSw3ICszNCw3IEBAIGluZGV4IDhjOGU5MTcuLmY2YTI1ZjYgMTAwNzU1CiAg
IwogICMgZ3RrLWRvYyAtIEdUSyBEb2NCb29rIGRvY3VtZW50YXRpb24gZ2VuZXJhdG9yLgogZGlm
ZiAtLWdpdCBhL2d0a2RvYy1kZXBzY2FuLmluIGIvZ3RrZG9jLWRlcHNjYW4uaW4KLWluZGV4IDli
ZmFmMzAuLmFhZGM5NTIgMTAwNzU1CitpbmRleCBjNDMzMTdjLi4yMDA4MzdjIDEwMDc1NQogLS0t
IGEvZ3RrZG9jLWRlcHNjYW4uaW4KICsrKyBiL2d0a2RvYy1kZXBzY2FuLmluCiBAQCAtMSw0ICsx
LDQgQEAKQEAgLTQ1LDcgKzQ0LDcgQEAgaW5kZXggOWJmYWYzMC4uYWFkYzk1MiAxMDA3NTUKICBm
cm9tIF9fZnV0dXJlX18gaW1wb3J0IHByaW50X2Z1bmN0aW9uCiAgCiBkaWZmIC0tZ2l0IGEvZ3Rr
ZG9jLWZpeHhyZWYuaW4gYi9ndGtkb2MtZml4eHJlZi5pbgotaW5kZXggNDRmNmJkMS4uMjZmYmQ5
MyAxMDA3NTUKK2luZGV4IGY5YzQ5MDUuLmVkMmVhZDEgMTAwNzU1CiAtLS0gYS9ndGtkb2MtZml4
eHJlZi5pbgogKysrIGIvZ3RrZG9jLWZpeHhyZWYuaW4KIEBAIC0xLDQgKzEsNCBAQApAQCAtNTUs
NyArNTQsNyBAQCBpbmRleCA0NGY2YmQxLi4yNmZiZDkzIDEwMDc1NQogICMKICAjIGd0ay1kb2Mg
LSBHVEsgRG9jQm9vayBkb2N1bWVudGF0aW9uIGdlbmVyYXRvci4KIGRpZmYgLS1naXQgYS9ndGtk
b2MtbWtkYi5pbiBiL2d0a2RvYy1ta2RiLmluCi1pbmRleCA0MmQ1NzMxLi4zYTU2ZDU2IDEwMDc1
NQoraW5kZXggNjQxZjNjNC4uMzVlOTVmYiAxMDA3NTUKIC0tLSBhL2d0a2RvYy1ta2RiLmluCiAr
KysgYi9ndGtkb2MtbWtkYi5pbgogQEAgLTEsNCArMSw0IEBACkBAIC02NSw3ICs2NCw3IEBAIGlu
ZGV4IDQyZDU3MzEuLjNhNTZkNTYgMTAwNzU1CiAgIwogICMgZ3RrLWRvYyAtIEdUSyBEb2NCb29r
IGRvY3VtZW50YXRpb24gZ2VuZXJhdG9yLgogZGlmZiAtLWdpdCBhL2d0a2RvYy1ta2h0bWwuaW4g
Yi9ndGtkb2MtbWtodG1sLmluCi1pbmRleCAwZDBhMTVkLi45MTRmZjU1IDEwMDc1NQoraW5kZXgg
YjA5ZjdhOS4uOGQ0NTk2NiAxMDA3NTUKIC0tLSBhL2d0a2RvYy1ta2h0bWwuaW4KICsrKyBiL2d0
a2RvYy1ta2h0bWwuaW4KIEBAIC0xLDQgKzEsNCBAQApAQCAtNzUsNyArNzQsNyBAQCBpbmRleCAw
ZDBhMTVkLi45MTRmZjU1IDEwMDc1NQogICMKICAjIGd0ay1kb2MgLSBHVEsgRG9jQm9vayBkb2N1
bWVudGF0aW9uIGdlbmVyYXRvci4KIGRpZmYgLS1naXQgYS9ndGtkb2MtbWttYW4uaW4gYi9ndGtk
b2MtbWttYW4uaW4KLWluZGV4IGM1NDQ1Y2QuLjY1ZGI3MWEgMTAwNzU1CitpbmRleCA4ZjdiMDE4
Li45YmFjMGI2IDEwMDc1NQogLS0tIGEvZ3RrZG9jLW1rbWFuLmluCiArKysgYi9ndGtkb2MtbWtt
YW4uaW4KIEBAIC0xLDQgKzEsNCBAQApAQCAtODUsNyArODQsNyBAQCBpbmRleCBjNTQ0NWNkLi42
NWRiNzFhIDEwMDc1NQogICMKICAjIGd0ay1kb2MgLSBHVEsgRG9jQm9vayBkb2N1bWVudGF0aW9u
IGdlbmVyYXRvci4KIGRpZmYgLS1naXQgYS9ndGtkb2MtbWtwZGYuaW4gYi9ndGtkb2MtbWtwZGYu
aW4KLWluZGV4IGU4YzBjMDMuLmY4MDcyMzYgMTAwNzU1CitpbmRleCA3ZGNhNGIwLi44MDhmOTJk
IDEwMDc1NQogLS0tIGEvZ3RrZG9jLW1rcGRmLmluCiArKysgYi9ndGtkb2MtbWtwZGYuaW4KIEBA
IC0xLDQgKzEsNCBAQApAQCAtOTUsNyArOTQsNyBAQCBpbmRleCBlOGMwYzAzLi5mODA3MjM2IDEw
MDc1NQogICMKICAjIGd0ay1kb2MgLSBHVEsgRG9jQm9vayBkb2N1bWVudGF0aW9uIGdlbmVyYXRv
ci4KIGRpZmYgLS1naXQgYS9ndGtkb2MtcmViYXNlLmluIGIvZ3RrZG9jLXJlYmFzZS5pbgotaW5k
ZXggMTdhNzFjMi4uZWMzZmQyOCAxMDA3NTUKK2luZGV4IGU4YjBiZjUuLmE5NjBkOGYgMTAwNzU1
CiAtLS0gYS9ndGtkb2MtcmViYXNlLmluCiArKysgYi9ndGtkb2MtcmViYXNlLmluCiBAQCAtMSw0
ICsxLDQgQEAKQEAgLTEwNSw3ICsxMDQsNyBAQCBpbmRleCAxN2E3MWMyLi5lYzNmZDI4IDEwMDc1
NQogICMKICAjIGd0ay1kb2MgLSBHVEsgRG9jQm9vayBkb2N1bWVudGF0aW9uIGdlbmVyYXRvci4K
IGRpZmYgLS1naXQgYS9ndGtkb2Mtc2Nhbi5pbiBiL2d0a2RvYy1zY2FuLmluCi1pbmRleCA5NTRj
ODExLi5mNDYxNTA0IDEwMDc1NQoraW5kZXggNzg5M2ViYy4uYjdlYjgzZCAxMDA3NTUKIC0tLSBh
L2d0a2RvYy1zY2FuLmluCiArKysgYi9ndGtkb2Mtc2Nhbi5pbgogQEAgLTEsNCArMSw0IEBACkBA
IC0xMTUsNyArMTE0LDcgQEAgaW5kZXggOTU0YzgxMS4uZjQ2MTUwNCAxMDA3NTUKICAjCiAgIyBn
dGstZG9jIC0gR1RLIERvY0Jvb2sgZG9jdW1lbnRhdGlvbiBnZW5lcmF0b3IuCiBkaWZmIC0tZ2l0
IGEvZ3RrZG9jLXNjYW5nb2JqLmluIGIvZ3RrZG9jLXNjYW5nb2JqLmluCi1pbmRleCA0Y2JlMTMw
Li41MmMyYzI0IDEwMDc1NQoraW5kZXggNzY2MGM3MC4uYzZmZjA3MiAxMDA3NTUKIC0tLSBhL2d0
a2RvYy1zY2FuZ29iai5pbgogKysrIGIvZ3RrZG9jLXNjYW5nb2JqLmluCiBAQCAtMSw0ICsxLDQg
QEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzLzAwMDEtRG9u
LXQtdXNlLWRvY2Rpci1mcm9tLWVudmlyb25tZW50LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21l
L2d0ay1kb2MvZmlsZXMvMDAwMS1Eb24tdC11c2UtZG9jZGlyLWZyb20tZW52aXJvbm1lbnQucGF0
Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGY0MDEyNDg3N2MuLjAwMDAwMDAwMDAK
LS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvMDAwMS1Eb24tdC11c2UtZG9j
ZGlyLWZyb20tZW52aXJvbm1lbnQucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyNCArMCwwIEBA
Ci1Gcm9tIDcyZGZlZWMwZTQ5NDc4YjBiZmI0NzFjNDE1NTA0NDM5MWJhZDhlNmMgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCi1Gcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4K
LURhdGU6IEZyaSwgOCBEZWMgMjAyMyAxMDozNToyNSArMDAwMAotU3ViamVjdDogW1BBVENIXSBE
b24ndCB1c2UgZG9jZGlyIGZyb20gZW52aXJvbm1lbnQKLQotVXBzdHJlYW0tU3RhdHVzOiBTdWJt
aXR0ZWQgW2h0dHBzOi8vZ2l0bGFiLmdub21lLm9yZy9HTk9NRS9ndGstZG9jLy0vbWVyZ2VfcmVx
dWVzdHMvNzNdCi1TaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNv
bT4KLS0tLQotIGJ1aWxkc3lzdGVtcy9hdXRvdG9vbHMvZ3RrZG9jaXplLmluIHwgMiArLQotIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0
IGEvYnVpbGRzeXN0ZW1zL2F1dG90b29scy9ndGtkb2NpemUuaW4gYi9idWlsZHN5c3RlbXMvYXV0
b3Rvb2xzL2d0a2RvY2l6ZS5pbgotaW5kZXggODMxMjdiZi4uNzZkY2JmZCAxMDA3NTUKLS0tLSBh
L2J1aWxkc3lzdGVtcy9hdXRvdG9vbHMvZ3RrZG9jaXplLmluCi0rKysgYi9idWlsZHN5c3RlbXMv
YXV0b3Rvb2xzL2d0a2RvY2l6ZS5pbgotQEAgLTM5LDcgKzM5LDcgQEAgc2V0IC0gJGFyZ3MKLSAK
LSAjIGFzc3VtZSB3b3JraW5nIGRpcmVjdG9yeSBpZiBzcmNkaXIgaXMgbm90IHNldAotIHRlc3Qg
IiRzcmNkaXIiIHx8IHNyY2Rpcj0uCi0tdGVzdCAiJGRvY2RpciIgfHwgZG9jZGlyPSIkc3JjZGly
IgotK2RvY2Rpcj0iJHNyY2RpciIKLSAKLSAjIGRldGVjdCBjb25maWd1cmUgc2NyaXB0Ci0gbm9f
Y29uZmlndXJlX2ZvdW5kPTAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9j
L2ZpbGVzL2NvbmRpdGlvbmFsdGVzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRv
Yy9maWxlcy9jb25kaXRpb25hbHRlc3RzLnBhdGNoCmluZGV4IDIxYzJkYjc4MjYuLmIwYTM4ZmVk
ZDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzL2NvbmRpdGlv
bmFsdGVzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvY29u
ZGl0aW9uYWx0ZXN0cy5wYXRjaApAQCAtMSwyMyArMSwyMiBAQAotRnJvbSA3OGJiZjE4NTkzNDE0
N2E2OWNlYjRiNjE3ZDQyNGUxMmU3MDk5N2JmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAwMmYxMzU1ZDlkMmIxZmFkYWU3YTVhMzc4ZmQzM2JkOGFhMWJiZGY4IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91
bmRhdGlvbi5vcmc+CiBEYXRlOiBUdWUsIDI3IEp1biAyMDE3IDIxOjAwOjU4ICswMTAwCi1TdWJq
ZWN0OiBbUEFUQ0ggMy8zXSBndGstZG9jOiBIYW5kbGUgZmxvYXRpbmcgZ3RrLWRvYyBkZXBlbmRl
bmN5CitTdWJqZWN0OiBbUEFUQ0hdIGd0ay1kb2M6IEhhbmRsZSBmbG9hdGluZyBndGstZG9jIGRl
cGVuZGVuY3kKIAogQWxsb3cgdGhlIHRlc3RzIHRvIGJlIGV4cGxpY2l0bHkgZGlzYWJsZWQgdG8g
YXZvaWQgZmxvYXRpbmcgZGVwZW5kbmVjeQogaXNzdWVzLiBUaGlzIGlzIG5vdCByZWFsbHkgYW4g
aXNzdWUgd2l0aCBSU1MgYnV0IGlzIG9uIHByZXZpb3VzIHJlbGVhc2VzLgogCiBSUCAyMDE3LzYv
MjcKIFVwc3RyZWFtLVN0YXR1czogUGVuZGluZwotCiAtLS0KICBjb25maWd1cmUuYWMgfCAxMCAr
KysrKysrKysrCiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdp
dCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggNjg0ZTJkMS4uZTVlM2FhYiAx
MDA2NDQKK2luZGV4IDA0OTEwOTAuLjQyNzBjODggMTAwNjQ0CiAtLS0gYS9jb25maWd1cmUuYWMK
ICsrKyBiL2NvbmZpZ3VyZS5hYwotQEAgLTE0Niw2ICsxNDYsMTEgQEAgaWYgdGVzdCAieCRHQ0Mi
ID0gInh5ZXMiOyB0aGVuCitAQCAtODIsNiArODIsMTEgQEAgaWYgdGVzdCAieCRHQ0MiID0gInh5
ZXMiOyB0aGVuCiAgCWZpCiAgZmkKICAKQEAgLTI5LDcgKzI4LDcgQEAgaW5kZXggNjg0ZTJkMS4u
ZTVlM2FhYiAxMDA2NDQKICBkbmwgaWYgZ2xpYiBpcyBhdmFpbGFibGUgd2UgY2FuIGVuYWJsZSB0
aGUgdGVzdHMKICBQS0dfQ0hFQ0tfTU9EVUxFUyhURVNUX0RFUFMsIFtnbGliLTIuMCA+PSAyLjYu
MCBnb2JqZWN0LTIuMCA+PSAyLjYuMF0sCiAgCVsJZ2xpYl9wcmVmaXg9ImAkUEtHX0NPTkZJRyAt
LXZhcmlhYmxlPXByZWZpeCBnbGliLTIuMGAiCi1AQCAtMTU2LDYgKzE2MSwxMSBAQCBQS0dfQ0hF
Q0tfTU9EVUxFUyhURVNUX0RFUFMsIFtnbGliLTIuMCA+PSAyLjYuMCBnb2JqZWN0LTIuMCA+PSAy
LjYuMF0sCitAQCAtOTIsNiArOTcsMTEgQEAgUEtHX0NIRUNLX01PRFVMRVMoVEVTVF9ERVBTLCBb
Z2xpYi0yLjAgPj0gMi42LjAgZ29iamVjdC0yLjAgPj0gMi42LjBdLAogIAkJYnVpbGRfdGVzdHM9
Im5vIgogIAldCiAgKQpAQCAtNDEsNiArNDAsMyBAQCBpbmRleCA2ODRlMmQxLi5lNWUzYWFiIDEw
MDY0NAogIEFNX0NPTkRJVElPTkFMKEdUS19ET0NfVVNFX0xJQlRPT0wsIHRlc3QgLW4gIiRMSUJU
T09MIiAtYSB4JGd0a19kb2NfdXNlX2xpYnRvb2wgPSB4eWVzICkKICBkbmwgdGhpcyBlbmFibGVz
IHRoZSBydWxlIGluIHRlc3QvTWFrZWZpbGUuYW0KICBBTV9DT05ESVRJT05BTChCVUlMRF9URVNU
UywgdGVzdCB4JGJ1aWxkX3Rlc3RzID0geHllcykKLS0tIAotMi4xNC4xCi0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2ZpbGVzL25vLWNsb2JiZXIucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9uby1jbG9iYmVyLnBhdGNoCmluZGV4IGQxNjk1
NDc5ZGMuLjQ3MzJiOGE1NjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9j
L2ZpbGVzL25vLWNsb2JiZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2Mv
ZmlsZXMvbm8tY2xvYmJlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOGJjNGMxZjE2OWY4
OWJjNTUzMWRhNWI3ZTg5MmI4ZjIwZTBmOWExOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNTNiNzdkMmUxOWY2NzYyYTIxYTI3NDUxMjc2YmI2MzRlNGJmNzEwNCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiBE
YXRlOiBXZWQsIDIxIE1hciAyMDE4IDE0OjQ3OjI5ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGd0
ay1kb2M6IGRvbid0IHJlZ2VuZXJhdGUgZ3RrLWRvYyBpbiBkb19pbnN0YWxsCkBAIC0yMCwxNiAr
MjAsMTUgQEAgZmlsZXMgd2hpY2ggZG9uJ3QgYWxyZWFkeSBleGlzdC4KIAogVXBzdHJlYW0tU3Rh
dHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vYnVnemlsbGEuZ25vbWUub3JnL3Nob3dfYnVnLmNnaT9p
ZD03OTQ1NzFdCiBTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AaW50ZWwu
Y29tPgotCiAtLS0KICBidWlsZHN5c3RlbXMvYXV0b3Rvb2xzL2d0ay1kb2MubWFrZSB8IDIgKy0K
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL2J1aWxkc3lzdGVtcy9hdXRvdG9vbHMvZ3RrLWRvYy5tYWtlIGIvYnVpbGRzeXN0ZW1z
L2F1dG90b29scy9ndGstZG9jLm1ha2UKLWluZGV4IDdkOWEyN2YuLjhjYjMzNmQgMTAwNjQ0Citp
bmRleCBmYjJlN2UyLi40ZjZmZTJiIDEwMDY0NAogLS0tIGEvYnVpbGRzeXN0ZW1zL2F1dG90b29s
cy9ndGstZG9jLm1ha2UKICsrKyBiL2J1aWxkc3lzdGVtcy9hdXRvdG9vbHMvZ3RrLWRvYy5tYWtl
Ci1AQCAtMTExLDcgKzExMSw3IEBAIHNldHVwLWJ1aWxkLnN0YW1wOgorQEAgLTExMiw3ICsxMTIs
NyBAQCBzZXR1cC1idWlsZC5zdGFtcDoKICAJICAgICAgZGVzdGRpcj1gZGlybmFtZSAkKGFic19i
dWlsZGRpcikvJCRmaWxlYDsgXAogIAkgICAgICB0ZXN0IC1kICIkJGRlc3RkaXIiIHx8IG1rZGly
IC1wICIkJGRlc3RkaXIiOyBcCiAgCSAgICAgIHRlc3QgLWYgJChhYnNfc3JjZGlyKS8kJGZpbGUg
JiYgXApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZmlsZXMvcGtnLWNv
bmZpZy1uYXRpdmUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9wa2ct
Y29uZmlnLW5hdGl2ZS5wYXRjaAppbmRleCAxZDI2MGFhNzJiLi5iZDE0ZDc2NWU1IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9wa2ctY29uZmlnLW5hdGl2ZS5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrLWRvYy9maWxlcy9wa2ctY29uZmlnLW5h
dGl2ZS5wYXRjaApAQCAtMSwxMSArMSwxMCBAQAotRnJvbSBlYmIwZjczMTNhMDkzMWY2NDZlODZi
YWRjZTI2MjdlZmYyZmEzN2E4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBmNWRjM2U3
YWIzZDc0OTAzOTZhMTg2NTVjMTE1YzE1ZTIwMWIzODExIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGludGVsLmNvbT4KIERhdGU6IE1vbiwg
NSBTZXAgMjAxNiAyMjoyNTo0NCArMDEwMAogU3ViamVjdDogW1BBVENIXSBVc2UgbmF0aXZlIHBr
Zy1jb25maWcgd2hlbiBsb29raW5nIGZvciBndGstZG9jLgogCiBVcHN0cmVhbS1TdGF0dXM6IElu
YXBwcm9wcmlhdGUKIFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRl
bC5jb20+Ci0KIC0tLQogIGJ1aWxkc3lzdGVtcy9hdXRvdG9vbHMvZ3RrLWRvYy5tNCB8IDcgKysr
KysrLQogIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2d0ay1kb2NfMS4zMy4yLmJiIGIv
bWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZ3RrLWRvY18xLjM0LjAuYmIKc2ltaWxhcml0eSBp
bmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2d0ay1kb2MvZ3RrLWRvY18x
LjMzLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGstZG9jL2d0ay1kb2NfMS4z
NC4wLmJiCmluZGV4IDRmZDVhNmU5MjUuLjY5M2FlNDI3ZTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGstZG9jL2d0ay1kb2NfMS4zMy4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1n
bm9tZS9ndGstZG9jL2d0ay1kb2NfMS4zNC4wLmJiCkBAIC0yMSwxMiArMjEsMTEgQEAgUEFDS0FH
RUNPTkZJR1t0ZXN0c10gPSAiLS1lbmFibGUtdGVzdHMsLS1kaXNhYmxlLXRlc3RzLGdsaWItMi4w
IgogCiBDQUNIRURfQ09ORklHVVJFVkFSUyArPSAiYWNfY3ZfcGF0aF9YU0xUUFJPQz14c2x0cHJv
YyIKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiY2MxYjcwOWEyMGViMDMwYTI3OGEx
Zjk4NDJhMzYyZTAwNDAyYjdmODM0YWUxZGY0YzE5OThhNzIzMTUyYmY0MyIKK1NSQ19VUklbYXJj
aGl2ZS5zaGEyNTZzdW1dID0gImIyMGI3MmIzMmE4MGJjMThjN2Y5NzVjOWQ0YzE2NDYwYzIyNzY1
NjZhMGI1MGY4N2Q2ODUyZGZmM2FhNzg2MWMiCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1Eby1u
b3QtaGFyZG9jb2RlLXBhdGhzLXRvLXBlcmwtcHl0aG9uLWluLXNjcmlwdHMucGF0Y2ggXAogICAg
ICAgICAgICBmaWxlOi8vMDAwMS1Eby1ub3QtZXJyb3Itb3V0LWlmLXhzbHRwcm9jLWlzLW5vdC1m
b3VuZC5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9jb25kaXRpb25hbHRlc3RzLnBhdGNoIFwK
ICAgICAgICAgICAgZmlsZTovL25vLWNsb2JiZXIucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8v
MDAwMS1Eb24tdC11c2UtZG9jZGlyLWZyb20tZW52aXJvbm1lbnQucGF0Y2ggXAogICAgICAgICAg
ICAiCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRpdmUgPSAiIGZpbGU6Ly9wa2ctY29uZmlnLW5h
dGl2ZS5wYXRjaCIKIAotLSAKMi40Mi4wCgo=

--===============0584036978680576745==
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
packages/core2-64-poky-linux/gtk-doc/gtk-doc: PKGV changed from 1.33.2 [default] to 1.34.0 [default]
packages/core2-64-poky-linux/gtk-doc/gtk-doc: PKGSIZE changed from 566403 to 566546 (+0%)
packages/core2-64-poky-linux/gtk-doc: PV changed from "1.33.2" to "1.34.0"
packages/core2-64-poky-linux/gtk-doc: SRC_URI changed from "https://download.gnome.org/sources//gtk-doc/1.33/gtk-doc-1.33.2.tar.xz;name=archive file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch file://conditionaltests.patch file://no-clobber.patch file://0001-Don-t-use-docdir-from-environment.patch" to "https://download.gnome.org/sources//gtk-doc/1.34/gtk-doc-1.34.0.tar.xz;name=archive file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch file://conditionaltests.patch file://no-clobber.patch"
packages/core2-64-poky-linux/gtk-doc: PKGV changed from 1.33.2 [default] to 1.34.0 [default]

--===============0584036978680576745==--

