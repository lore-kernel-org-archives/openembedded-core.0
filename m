Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web10.53830.1622525067622181161
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 22:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VvMgBMwc;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622525065; i=@fujitsu.com;
	bh=U2YxfTldwCEMsp7XscwvTkGR9kYM7Swr/hHwcOnLCZ0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VvMgBMwcc0VGdKoKEcgVKArfTEMyH4D1I1n+Ri0+oLokrwAEvpMyIbxhCEZDsYgqC
	 4YcgQhxHJ5ry3R4eVaKX0TBhorX5koPJ8nsrFgvdhFLBq0HhrSjQemDXHGoDayDemu
	 Lth9ueO6zDJTY41LpmRi75APIsneQ3Lw5VvPyQ99GvJK/ZO/7fEaOyg/fof6RDg/if
	 ftKOtOGxanFzNvlSOFsQYpq4fvtJBkfT26GWalUVYj7vdAtBJI0X/NtNDw8KCaKGUi
	 Bf1qpwXmTuVcOA56gpvDA61v8SMlIF3lqAz+EAC4ZKPMgW2LeKbX9ce/QP+jjod25R
	 VbvAlemsF68OQ==
Received: from [100.112.193.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id FB/89-34775-984C5B06; Tue, 01 Jun 2021 05:24:25 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8MRottxZGu
  Cwao+Y4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPKkS0sBT8CKub8fsDewLjMtYuRi0NIYCaT
  xKInyxkhnOOMEqsfzmHuYuTkYBPQkeh40c3SxcjBISKgJ3H1nyiIKSxgLbGiuwLEZBFQkVj2x
  R/E5BVwl5iw3hCkT0JAQWLKw/dgM3gFBCVOznzCAmIzC0hIHHzxghmiRlFi+84zLBB2hcSMGd
  vYJjDyzELSMgtJywJGplWMFklFmekZJbmJmTm6hgYGuoaGRrqGlqa6RoameolVuol6qaW65an
  FJbqGeonlxXrFlbnJOSl6eaklmxiBAZRScPj6DsZbrz/oHWKU5GBSEuVd7bI1QYgvKT+lMiOx
  OCO+qDQntfgQowwHh5IEb/ZBoJxgUWp6akVaZg4wmGHSEhw8SiK8cQeA0rzFBYm5xZnpEKlTj
  LEc734uXsTM8WbtEiD5Fky23bsLJNvB5MwFB1czc8wCk/fbDwHJByBSiCUvPy9VSpzX4xDQUA
  GQoRmleXArYZF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr8lhoCk8mXklcJe9AjqaCej
  oz6GbQI4uSURISTUwzckUfNWZFaH8smB9o7lWpOQfxjv6yj13/j3ePcfJUvFe7WOFyw8/ak5o
  eStxxiXdtOqjw9PPxw6VTTz7Snkll4Wn2iTuwL/7JDdOsmCNuXzb6cMz8VdCD2d4c/CcmGv0j
  PUHwwnmWxs1d13dOPFriOvbfVX/1zmemt1nsOHrXWeFh46dKbrGYgZslmd2Z+hbT2gLsV605z
  TnQ+v5svUL63S/uwuwFpzafYFh37cFd/dfzXBQtwtyPL7+H3+UeWhw6QbPS8KLRe+rOXbe2/m
  e5+deA9nbKhuYdlrNWBMs7H6j5tfvJ3yq/OmfQxcfUXOz+/xbXT7FfHsoV9SUes51Il+rxJO4
  mU0WyFz4mrMsSYmlOCPRUIu5qDgRAHXKsvdXAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-271.messagelabs.com!1622525064!67291!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 890 invoked from network); 1 Jun 2021 05:24:24 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-12.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Jun 2021 05:24:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1515OGrM014469
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jun 2021 06:24:24 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Tue, 1 Jun 2021 06:24:15 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] elfutils: upgrade 0.183 -> 0.185
Date: Tue, 1 Jun 2021 13:24:05 +0800
Message-ID: <1622525045-17496-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

From: Wang Mingyu <wangmy@fujitsu.com>

0001-add-support-for-ipkg-to-debuginfod.cxx.patch
Removed since this is included in 0.185.

Refresh the following patch:
0001-debuginfod-debuginfod-client.c-correct-string-format.patch
0015-config-eu.am-do-not-use-Werror.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{elfutils_0.183.bb => elfutils_0.185.bb}  |  5 +-
 ...d-support-for-ipkg-to-debuginfod.cxx.patch | 33 -----------
 ...infod-client.c-correct-string-format.patch | 56 +++++++------------
 .../0015-config-eu.am-do-not-use-Werror.patch | 23 ++++----
 4 files changed, 34 insertions(+), 83 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.183.bb => elfutils_0.185.bb} (97%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
similarity index 97%
rename from meta/recipes-devtools/elfutils/elfutils_0.183.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.185.bb
index 7aebaf1b6d..970cdcca60 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
@@ -21,16 +21,15 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
-           file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch \
            file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
            "
 SRC_URI_append_libc-musl = " \
            file://0002-musl-libs.patch \
            file://0003-musl-utils.patch \
            file://0004-Fix-error-on-musl.patch \
-           file://0015-config-eu.am-do-not-use-Werror.patch \
+           file://0015-config-eu.am-do-not-use-Werror.patch \ 
            "
-SRC_URI[sha256sum] = "c3637c208d309d58714a51e61e63f1958808fead882e9b607506a29e5474f2c5"
+SRC_URI[sha256sum] = "dc8d3e74ab209465e7f568e1b3bb9a5a142f8656e2b57d10049a73da2ae6b5a6"
 
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
index 5bd6ba961c..6a16718538 100644
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
@@ -1,6 +1,6 @@
-From 14dfe84943b8f9e6f504536d8735ef6356210b40 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 19 Apr 2021 23:29:10 +0200
+From 7355a34d3796272e6213b676e042809686eb398a Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Mon, 31 May 2021 17:38:30 +0900
 Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on
  32bit arches with 64bit time_t
 
@@ -17,58 +17,40 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- debuginfod/debuginfod-client.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
+ debuginfod/debuginfod-client.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
-index de26af5..39e28f2 100644
+index ee7eda2..9b26712 100644
 --- a/debuginfod/debuginfod-client.c
 +++ b/debuginfod/debuginfod-client.c
-@@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+@@ -267,7 +267,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
    if (fd < 0)
      return -errno;
  
 -  if (dprintf(fd, "%ld", cache_clean_default_interval_s) < 0)
-+  if (dprintf(fd, "%jd", (intmax_t)cache_clean_default_interval_s) < 0)
++  if (dprintf(fd, "%ld", (intmax_t)cache_clean_default_interval_s) < 0)
      return -errno;
  
    /* init max age config file.  */
-@@ -237,7 +237,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+@@ -275,7 +275,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
        && (fd = open(maxage_path, O_CREAT | O_RDWR, DEFFILEMODE)) < 0)
      return -errno;
  
 -  if (dprintf(fd, "%ld", cache_default_max_unused_age_s) < 0)
-+  if (dprintf(fd, "%jd", (intmax_t)cache_default_max_unused_age_s) < 0)
++  if (dprintf(fd, "%ld", (intmax_t)cache_default_max_unused_age_s) < 0)
      return -errno;
  
    return 0;
-@@ -263,7 +263,7 @@ debuginfod_clean_cache(debuginfod_client *c,
-       if (interval_file == NULL)
-         return -errno;
+@@ -303,7 +303,7 @@ debuginfod_clean_cache(debuginfod_client *c,
+   /* Check timestamp of interval file to see whether cleaning is necessary.  */
+   if (time(NULL) - st.st_mtime < clean_interval)
+     /* Interval has not passed, skip cleaning.  */
+-    return 0;
++    return 0;/
  
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
+   /* Read max unused age value from config file.  */
+   rc = debuginfod_config_cache(max_unused_path,
 -- 
-2.31.1
+2.25.1
 
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
index 205362626d..1857b7010e 100644
--- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
@@ -1,6 +1,6 @@
-From dfe11e043cd8ea0b0f0252bcff9f5a6b98c0ecd3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 22 Jun 2020 21:35:16 +0000
+From 5226351f21f7011440c2f6acfec50fbfd69796e4 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Tue, 1 Jun 2021 11:02:10 +0900
 Subject: [PATCH] config/eu.am: do not use -Werror
 
 Due to re-definition of error() on musl, gcc starts throwing
@@ -16,22 +16,25 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
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

