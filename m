Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.5640.1621500458340411842
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 01:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=g/bDv+F1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621500455; i=@fujitsu.com;
	bh=BIVotDmLIWmTYWx3Hj6N/8Ms+jkdqifNrxCYrtSJhUM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=g/bDv+F1roPvYcgX3aHRxCL53EEvPtiSaeqMF5as4JHdYT2R5kG6oH8HYfEozqjxQ
	 DjZki0U7Uxr8wJqAAi+Q71RFzdxhOQ+X8u8lQizIW4CbzLHhH5bBqaZVqMAUlcG944
	 Hbo5nSX5vSrIuhTAn9EfhVd0sHnrsEwtcLyTakAezdZfAAPJ4EGoOInDOANkvUB7Ly
	 K8bym3VUjWIgYkg3S0pVVxf+X08hJVR7x7giziHNPNJeuz/g0Die73y1+3k8EItytd
	 Y5AFifzrl32XXbEw+Swbf/MWHGKWbJQWNQnpi29gASD/5hRZd1x1v50lBzGESNact4
	 e4qO7PE1IiP/w==
Received: from [100.113.6.49] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 3F/5C-15146-72226A06; Thu, 20 May 2021 08:47:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxVVddaVm
  CwZwJTBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aGW5fYC6Z6VSxavp6tgXGlfRcjF4eQwCwm
  iSnPW5ggnBOMEjenLmXsYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv3vYQWxhATuJO
  xO/MYGUsAioSmxfEw4S5hVwkvhw9wcTiC0hoCAx5eF7Zoi4oMTJmU9YIMZISBx88YIZokZRYv
  blZhYIu0Li9eFLzBMYeWchaZmFpGUBI9MqRsukosz0jJLcxMwcXUMDA11DQ2NdE10jA1O9xCr
  dJL3UUt3k1LySokSgrF5iebFecWVuck6KXl5qySZGYHilFLKc3cH45fUHvUOMkhxMSqK8ZvcX
  JQjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4I1SWJYgJFiUmp5akZaZAwx1mLQEB4+SCC+3LFCat
  7ggMbc4Mx0idYpRl+Pdz8WLmIVY8vLzUqXEec+AzBAAKcoozYMbAYu7S4yyUsK8jAwMDEI8Ba
  lFuZklqPKvGMU5GJWEeU1BpvBk5pXAbXoFdAQT0BH/GxeBHFGSiJCSamAK9hdR+dW1/j1Lq+L
  x/cnxOlX663R/fmHp2uK4eEH4S+6+wxW+fTyix2d7b56pxiKzUn/y1jYWvr9B/Bo3lNaG1SiZ
  8vMYLBZ26dQ5Hpdofz93htX+FEX10v0P2Zu67C1D7p/9v6Zri4fvtp7HOZ2/5JP8lsZm6ObN/
  752yoMIzXO8bMEL802il55YGn6Ftd3PSWbDhWgd4/uc55Xv/S4sKfaeWGz7YS2viPMLue/BEy
  3Ttl14kVoY2h/iv9ouae/GKo3FTwSXV/zXD9bP2Fy0xZLvuRJHT+1qNceKL5cm/0vb3RDd88W
  SM3yd6LHwCimNxX4Psy+ff5oUt3055ylWNac626mlR1tmZodFK7EUZyQaajEXFScCAJW7HFo2
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-245.messagelabs.com!1621500454!261842!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16068 invoked from network); 20 May 2021 08:47:34 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-16.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 08:47:34 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K8lSnm024856
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 09:47:34 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 09:47:27 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] elfutils: upgrade 0.183 -> 0.184
Date: Thu, 20 May 2021 16:47:16 +0800
Message-ID: <1621500436-22668-1-git-send-email-wangmy@fujitsu.com>
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
 ...d-support-for-ipkg-to-debuginfod.cxx.patch | 33 -----------
 ...infod-client.c-correct-string-format.patch | 56 +++++++++----------
 .../0015-config-eu.am-do-not-use-Werror.patch | 19 ++++---
 4 files changed, 37 insertions(+), 74 deletions(-)
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
index 5bd6ba961c..6406f91d42 100644
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
@@ -16,15 +16,18 @@ Upstream-Status: Pending
 
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+rebase for 0.184
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
- debuginfod/debuginfod-client.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ debuginfod/debuginfod-client.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
-index de26af5..39e28f2 100644
+index 4fa047f..a6a3508 100644
 --- a/debuginfod/debuginfod-client.c
 +++ b/debuginfod/debuginfod-client.c
-@@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+@@ -268,7 +268,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
    if (fd < 0)
      return -errno;
  
@@ -33,7 +36,7 @@ index de26af5..39e28f2 100644
      return -errno;
  
    /* init max age config file.  */
-@@ -237,7 +237,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+@@ -276,7 +276,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
        && (fd = open(maxage_path, O_CREAT | O_RDWR, DEFFILEMODE)) < 0)
      return -errno;
  
@@ -42,33 +45,24 @@ index de26af5..39e28f2 100644
      return -errno;
  
    return 0;
-@@ -263,7 +263,7 @@ debuginfod_clean_cache(debuginfod_client *c,
-       if (interval_file == NULL)
-         return -errno;
+@@ -296,7 +296,7 @@ debuginfod_clean_cache(debuginfod_client *c,
  
--      int rc = fprintf(interval_file, "%ld", cache_clean_default_interval_s);
-+      int rc = fprintf(interval_file, "%jd", (intmax_t)cache_clean_default_interval_s);
-       fclose(interval_file);
+   /* Create new interval file.  */
+   rc = debuginfod_config_cache(interval_path,
+-			       cache_clean_default_interval_s, &st);
++			       (intmax_t)(cache_clean_default_interval_s), &st);
+   if (rc < 0)
+     return rc;
+   clean_interval = (time_t)rc;
+@@ -308,7 +308,7 @@ debuginfod_clean_cache(debuginfod_client *c,
  
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
+   /* Read max unused age value from config file.  */
+   rc = debuginfod_config_cache(max_unused_path,
+-			       cache_default_max_unused_age_s, &st);
++			       (intmax_t)(cache_default_max_unused_age_s), &st);
+   if (rc < 0)
+     return rc;
+   max_unused_age = (time_t)rc;
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

