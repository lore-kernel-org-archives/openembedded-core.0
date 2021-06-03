Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web11.4661.1622704433935653443
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 00:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DEBDvHlx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622704431; i=@fujitsu.com;
	bh=nl05Ej+eBJP+RTNMhY+V8fUENtzah5FBPHDkvyojvyA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DEBDvHlxHJWEu1Q2v78ccpTUeB1vjUJ1JmPLZ8Vp4d3i9d503s+eGT70Ss0l1FXZN
	 WA8VXrA7bq5VIfm3jnMjwxxc4n75pKFonP6mddeupApuTTDpcOjUt+GFex8KrwuysA
	 uztYOSw4m3SC+4+o+zA6Qvp1okmyaMN4/PDUM2lbDpwPwGSmYSF/yh8MxSJ5UfCTVt
	 ujVt0CfVEVFiA83B8MuM5v9p4oibUQRiDJV0oXwddyMlDnOmOu2xH8x5njhJQQVJOK
	 FvmcY2Z4ZQ6VGItJPc0EkyA6C3UuO0qkcLTqAyI7F06vl9o2TFlSombuG0vpCLeNdb
	 a+fGZBk8G985w==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id 47/A2-33893-F2188B06; Thu, 03 Jun 2021 07:13:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrGIsWRWlGSWpSXmKPExsViZ8MxVVe/cUe
  CwZ4bMhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aq73cZC7ZqV0zrXMHWwNiu3sXIxSEkMJNJ
  4tKNa4wQznFGicMdd1m7GDk52ATUJKbfugFkc3CICOhJXP0nChJmFlCRePG7hx3EFhawlVjza
  icLiM0CFL+/+hATiM0r4CRxf80xsBoJAQWJKQ/fM4PYnALOEsd+PAOrFwKq2dHTwQ5RLyhxcu
  YTFoj5EhIHX7xghuhVlJh9uZkFwq6QeH34EvMERv5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9f
  QwEDX0NBY11DXyMBcL7FKN1EvtVQ3OTWvpCgRKKuXWF6sV1yZm5yTopeXWrKJERiQKYWM53cw
  Tn3zQe8QoyQHk5Ior3HajgQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErxF9UA5waLU9NSKtMwcY
  HTApCU4eJREeOVqgdK8xQWJucWZ6RCpU4zhHG/WLlnEzPEWTLbduwsk28HkzAUHVzNzzAKT99
  sPAckHIFKIJS8/L1VKnPctyDYBkHEZpXlwy2DRf4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6O
  SMO8BkCk8mXklcDe9AjqXCehcAa9tIOeWJCKkpBqYzNjjutMXHN/OJDH7YPXUeyvYDbLzq9v8
  Tmz/t7s+OISvoXwq67/FytXnjTKeTMq/yDf1j/eCG2v+yCZZmfifXXZN5xdjwpnimY5/Iq7Ey
  /AYvK7pcry8TFVdTzP5S9HuxKyTWjVTtK9fy/xUGbdMNVZUVOCQ4Jka9pr9z99fPO45+et/08
  XdRvlrtlzewnnK2mfr/zDeuvbVLZzVK+rdPZcfSpgi9Xvij3ORPls6f7on9lxcf2r39isZspL
  masWPrQ9J/c18IKt2+ctsY/8dy4sdgx4mG6ksPpGxgO3xWsHtP125tl5erq8WYPN0rrOpi0D8
  s19rejk/ZKnfubc37/kp9lc2m7MFrU/94293U2Ipzkg01GIuKk4EACpqQel5AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-228.messagelabs.com!1622704430!112665!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28415 invoked from network); 3 Jun 2021 07:13:51 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-15.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Jun 2021 07:13:51 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1537DnTa026266
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jun 2021 08:13:50 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 3 Jun 2021 08:13:47 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] util-linux: upgrade 2.36.2 -> 2.37
Date: Thu, 3 Jun 2021 15:13:21 +0800
Message-ID: <1622704403-26153-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1622704403-26153-1-git-send-email-wangmy@fujitsu.com>
References: <1622704403-26153-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

avoid_parallel_tests.patch
Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
removed since they are included in 2.37

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...d_2.36.2.bb => util-linux-libuuid_2.37.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  4 +-
 ...RA_LTLIBRARIES-instead-of-noinst_LTL.patch | 49 -------------------
 .../util-linux/avoid_parallel_tests.patch     | 20 --------
 ...til-linux_2.36.2.bb => util-linux_2.37.bb} |  0
 5 files changed, 1 insertion(+), 72 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.36.2.bb => util-linux-libuuid_2.37.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
 rename meta/recipes-core/util-linux/{util-linux_2.36.2.bb => util-linux_2.37.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.37.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index cbf6102ee0..8e33e6ca01 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -35,7 +35,5 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz
            file://ptest.patch \
            file://run-ptest \
            file://display_testname_for_subtest.patch \
-           file://avoid_parallel_tests.patch \
-           file://Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch \
            "
-SRC_URI[sha256sum] = "f7516ba9d8689343594356f0e5e1a5f0da34adfbc89023437735872bb5024c5f"
+SRC_URI[sha256sum] = "bd07b7e98839e0359842110525a3032fdb8eaf3a90bedde3dd1652d32d15cce5"
diff --git a/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch b/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
deleted file mode 100644
index 272518914e..0000000000
--- a/meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Author: Luca Boccassi <luca.boccassi@microsoft.com>
-Description: Automake: use EXTRA_LTLIBRARIES instead of noinst_LTLIBRARIES
- noinst_LTLIBRARIES causes the libraries to be always built
- unconditionally. EXTRA_LTLIBRARIES causes them to be built
- only if other build target needs them.
- In other words, avoid building libcommon.a and libtcolors.a
- unless they are needed by another library/executable and
- save some build time.
-Upstream-Status: backport, commit:c65953d72bbc7412f32e566d9fa6e780d84f0696
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -39,7 +39,7 @@ bashcompletiondir = @bashcompletiondir@
- 
- dist_noinst_HEADERS =
- noinst_PROGRAMS =
--noinst_LTLIBRARIES =
-+EXTRA_LTLIBRARIES =
- usrbin_exec_PROGRAMS =
- usrsbin_exec_PROGRAMS =
- dist_man_MANS =
-@@ -169,7 +169,7 @@ else
- edit_cmd += -e 's|@vendordir[@]||g'
- endif
- 
--CLEANFILES += $(PATHFILES)
-+CLEANFILES += $(PATHFILES) $(EXTRA_LTLIBRARIES)
- EXTRA_DIST += $(PATHFILES:=.in)
- 
- $(PATHFILES): Makefile
---- a/lib/Makemodule.am
-+++ b/lib/Makemodule.am
-@@ -9,7 +9,7 @@
- # Note that you need "make install-strip" (or proper rpm / Debian build)
- # to generate binaries with only relevant stuff.
- #
--noinst_LTLIBRARIES += libcommon.la
-+EXTRA_LTLIBRARIES += libcommon.la
- libcommon_la_CFLAGS = $(AM_CFLAGS)
- libcommon_la_SOURCES = \
- 	lib/blkdev.c \
-@@ -59,7 +59,7 @@ libcommon_la_SOURCES += lib/sysfs.c
- endif
- endif
- 
--noinst_LTLIBRARIES += libtcolors.la
-+EXTRA_LTLIBRARIES += libtcolors.la
- libtcolors_la_CFLAGS = $(AM_CFLAGS)
- libtcolors_la_SOURCES = lib/colors.c lib/color-names.c include/colors.h include/color-names.h
- libtcolors_la_LIBADD =
diff --git a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch b/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
deleted file mode 100644
index 748b6ef096..0000000000
--- a/meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Ptest needs buildtest-TESTS and runtest-TESTS targets.
-serial-tests is required to generate those targets.
-Revert run.sh script accordingly to serialize running tests 
-
-Signed-off-by: Tudor Florea  <tudor.florea@enea.com>
-Upstream-Status: Inappropriate 
-
-Index: util-linux-2.32/configure.ac
-===================================================================
---- util-linux-2.32.orig/configure.ac
-+++ util-linux-2.32/configure.ac
-@@ -11,7 +11,7 @@ AC_CONFIG_MACRO_DIR([m4])
- dnl AC_USE_SYSTEM_EXTENSIONS must be called before any macros that run
- dnl the compiler (like AC_PROG_LIBTOOL) to avoid autoconf errors.
- AC_USE_SYSTEM_EXTENSIONS
--AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax no-dist-gzip dist-xz subdir-objects])
-+AM_INIT_AUTOMAKE([-Wall foreign 1.10 tar-pax no-dist-gzip dist-xz subdir-objects serial-tests])
- 
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])],
- 			    [AC_SUBST([AM_DEFAULT_VERBOSITY], [1])])
diff --git a/meta/recipes-core/util-linux/util-linux_2.36.2.bb b/meta/recipes-core/util-linux/util-linux_2.37.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.36.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.37.bb
-- 
2.25.1

