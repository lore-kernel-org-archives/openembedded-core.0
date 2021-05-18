Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web08.2789.1621302226033532319
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 18:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SPVv59YV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621302214; i=@fujitsu.com;
	bh=46BNdEWYtcrjcleUjAnGmoLvzbmkZR5Ky4BvmZeiEhA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SPVv59YVmDA8koOZWCbaHUAJpG0gShzDzOBdZg3a4YAJpN92cG2X1R3BdWb0kjk+4
	 xj2uUe+crDkOcgtHkCtckJGWQxPfABcld1Fa2JG6qFCON+N6FiwzSoQe54jgnTn0EL
	 AqgerXDPoARZj9jig+C/vF5ps+DAhcxyOADkTyVNLbix8P9lkUa+VB3jeMxDTU0xt+
	 MI+D3ipDvneKfDMHTzY2/8QCujA6Z2dJYqExsSekxdSJil71z0E5DPx3oUjBhqnnHi
	 8EdMCLezV8pn2TpxWhJ1mtXaQGzF7nqUYgnpGwpKMfJYayDxjJzi4FOvzYCBVue3uB
	 geypIVOIAOMYA==
Received: from [100.112.199.171] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 25/7D-55921-5CB13A06; Tue, 18 May 2021 01:43:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRWlGSWpSXmKPExsViZ8MxRfeo9OI
  Egy+L5S3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxHV/tZC+64VLw7cIi1gfGfVRcjF4eQwCwm
  idP7v7F3MXICOScYJeacTACx2QTUJKbfusHaxcjBISKgJ3H1nyhImFlAReLF7x6wcmEBa4mz0
  3+zgdgsAqoS27+dYAaxeQWcJFYdu8wIYksIKEhMefgeKi4ocXLmExaIORISB1+8YIaoUZSYfb
  mZBcKukHh9+BLzBEbeWUhaZiFpWcDItIrRPKkoMz2jJDcxM0fX0MBA19DQSNfQ0kzXzEQvsUo
  3SS+1VLc8tbhE11AvsbxYr7gyNzknRS8vtWQTIzC0UgqOOOxgvP/6g94hRkkOJiVRXrP7ixKE
  +JLyUyozEosz4otKc1KLDzHKcHAoSfAWSC1OEBIsSk1PrUjLzAGGOUxagoNHSYR3E0iat7ggM
  bc4Mx0idYpRl+Pdz8WLmIVY8vLzUqXEeX+CFAmAFGWU5sGNgMXcJUZZKWFeRgYGBiGegtSi3M
  wSVPlXjOIcjErCvGzACBbiycwrgdv0CugIJqAj/jcuAjmiJBEhJdXA5CygELeNpeWixJvwX73
  3ulfzpf/Pmtvtm7aSM93iOd99V+1mB3PtEjGOtU5TN4r/j3E3dFrGK3Xa/WzY4756SXXV7xNu
  rjPeWiV7hv+MAyvLygqrHW0bzz2X3vPPZE71qdUZU3P/xz6tmLzh3wt7vqKKpZ8Z98QerCo3F
  vhZIHLvXJ4V5wnhZ3/vHV5alimlps2b5nP1X2A6b3CNUMAblT/657dx5jInRh53j8j/c/mZ84
  rpc813eydu/HVVoOyd2R9T3+ApbafPufY9XTgl/NckuS9nvI9obDK5XLFZP3l1VBl3105lJ+l
  J77Vfy14ojZ7l4nHC+cCHf22ZTP/tFsVo/E25cydnI1fwVecCJZbijERDLeai4kQAw67krTQD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-285.messagelabs.com!1621302213!100882!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4553 invoked from network); 18 May 2021 01:43:33 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 May 2021 01:43:33 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14I1hOgj022980
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 02:43:33 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 18 May 2021 02:43:22 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] elfutils: upgrade 0.183 -> 0.184
Date: Tue, 18 May 2021 09:43:05 +0800
Message-ID: <1621302185-15385-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

0001-add-support-for-ipkg-to-debuginfod.cxx.patch
removed since it is included in 0.184.

refresh 0001-debuginfod-debuginfod-client.c-correct-string-format.patch
and 0015-config-eu.am-do-not-use-Werror.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{elfutils_0.183.bb => elfutils_0.184.bb}  |  3 +-
 ...d-support-for-ipkg-to-debuginfod.cxx.patch | 33 ---------------
 ...infod-client.c-correct-string-format.patch | 40 ++++---------------
 .../0015-config-eu.am-do-not-use-Werror.patch | 19 +++++----
 4 files changed, 19 insertions(+), 76 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.183.bb => elfutils_0.184.bb} (97%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.184.bb
similarity index 97%
rename from meta/recipes-devtools/elfutils/elfutils_0.183.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.184.bb
index 7aebaf1b6d..1726ebc340 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.184.bb
@@ -21,7 +21,6 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
-           file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch \
            file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
            "
 SRC_URI_append_libc-musl = " \
@@ -30,7 +29,7 @@ SRC_URI_append_libc-musl = " \
            file://0004-Fix-error-on-musl.patch \
            file://0015-config-eu.am-do-not-use-Werror.patch \
            "
-SRC_URI[sha256sum] = "c3637c208d309d58714a51e61e63f1958808fead882e9b607506a29e5474f2c5"
+SRC_URI[sha256sum] = "87e7d1d7f0333815dd1f62135d047a4dc4082068f361452f357997c11360644b"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch b/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
deleted file mode 100644
index 5f82afef0c..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 571416bf5b5ef319df6d9c79e46680920487e4a7 Mon Sep 17 00:00:00 2001
-From: dorindabassey <dorindabassey@gmail.com>
-Date: Sat, 19 Dec 2020 01:11:46 +0100
-Subject: [PATCH] add support for ipkg to debuginfod.cxx
-
-added support for ipkg to the debuginfod scanner. 0.182 only supports RPM and scan .debs, with this patch, debuginfod scanner would be able to scan .ipk
-
-Upstream-status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2020q4/003357.html]
-
-Signed-off-by: dorindabassey <dorindabassey@gmail.com>
-
----
- debuginfod/debuginfod.cxx | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
-index b34eacc..a8915f2 100644
---- a/debuginfod/debuginfod.cxx
-+++ b/debuginfod/debuginfod.cxx
-@@ -484,11 +484,13 @@ parse_opt (int key, char *arg,
-         {
-           scan_archives[".deb"]="dpkg-deb --fsys-tarfile";
-           scan_archives[".ddeb"]="dpkg-deb --fsys-tarfile";
-+          scan_archives[".ipk"]="dpkg-deb --fsys-tarfile";
-         }
-       else
-         {
-           scan_archives[".deb"]="(bsdtar -O -x -f - data.tar.xz)<";
-           scan_archives[".ddeb"]="(bsdtar -O -x -f - data.tar.xz)<";
-+          scan_archives[".ipk"]="(bsdtar -O -x -f - data.tar.xz)<";
-         }
-       // .udeb too?
-       break;
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
index 5bd6ba961c..40ad3163a2 100644
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
@@ -16,15 +16,16 @@ Upstream-Status: Pending
 
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
- debuginfod/debuginfod-client.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ debuginfod/debuginfod-client.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
-index de26af5..39e28f2 100644
+index 4fa047f..5afb215 100644
 --- a/debuginfod/debuginfod-client.c
 +++ b/debuginfod/debuginfod-client.c
-@@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+@@ -268,7 +268,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
    if (fd < 0)
      return -errno;
  
@@ -33,7 +34,7 @@ index de26af5..39e28f2 100644
      return -errno;
  
    /* init max age config file.  */
-@@ -237,7 +237,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+@@ -276,7 +276,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
        && (fd = open(maxage_path, O_CREAT | O_RDWR, DEFFILEMODE)) < 0)
      return -errno;
  
@@ -42,33 +43,6 @@ index de26af5..39e28f2 100644
      return -errno;
  
    return 0;
-@@ -263,7 +263,7 @@ debuginfod_clean_cache(debuginfod_client *c,
-       if (interval_file == NULL)
-         return -errno;
- 
--      int rc = fprintf(interval_file, "%ld", cache_clean_default_interval_s);
-+      int rc = fprintf(interval_file, "%jd", (intmax_t)cache_clean_default_interval_s);
-       fclose(interval_file);
- 
-       if (rc < 0)
-@@ -275,7 +275,7 @@ debuginfod_clean_cache(debuginfod_client *c,
-   interval_file = fopen(interval_path, "r");
-   if (interval_file)
-     {
--      if (fscanf(interval_file, "%ld", &clean_interval) != 1)
-+      if (fscanf(interval_file, "%jd", (intmax_t*)(&clean_interval)) != 1)
-         clean_interval = cache_clean_default_interval_s;
-       fclose(interval_file);
-     }
-@@ -291,7 +291,7 @@ debuginfod_clean_cache(debuginfod_client *c,
-   max_unused_file = fopen(max_unused_path, "r");
-   if (max_unused_file)
-     {
--      if (fscanf(max_unused_file, "%ld", &max_unused_age) != 1)
-+      if (fscanf(max_unused_file, "%jd", (intmax_t*)(&max_unused_age)) != 1)
-         max_unused_age = cache_default_max_unused_age_s;
-       fclose(max_unused_file);
-     }
 -- 
-2.31.1
+2.25.1
 
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
index 205362626d..753e8a6410 100644
--- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
@@ -10,28 +10,31 @@ Werror.
 
 Upstream-Status: Inappropriate [oe core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  config/eu.am | 2 --
  1 file changed, 2 deletions(-)
 
 diff --git a/config/eu.am b/config/eu.am
-index 6c3c444..3bc0dc9 100644
+index 2c3e457..8fb0411 100644
 --- a/config/eu.am
 +++ b/config/eu.am
-@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
- 	    -Wold-style-definition -Wstrict-prototypes -Wtrampolines \
+@@ -89,7 +89,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
+ 	    -Wold-style-definition -Wstrict-prototypes $(TRAMPOLINES_WARNING) \
  	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
 -	    $(if $($(*F)_no_Werror),,-Werror) \
  	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
- 	    $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
-@@ -83,7 +82,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
- 	   -Wtrampolines \
+ 	    $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
+@@ -99,7 +98,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
+ 	   $(TRAMPOLINES_WARNING) \
  	   $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
  	   $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
 -	   $(if $($(*F)_no_Werror),,-Werror) \
  	   $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
  	   $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
- 	   $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
+ 	   $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
+-- 
+2.25.1
+
-- 
2.25.1

