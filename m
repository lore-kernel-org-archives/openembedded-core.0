Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.1966.1622826033739950531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 10:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=JDj68Vda;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.99] (cpe-68-201-52-49.elp.res.rr.com [68.201.52.49])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6158220B7178;
	Fri,  4 Jun 2021 10:00:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6158220B7178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1622826032;
	bh=+46IAopK8b5qaggXKM17N6qmUqWMtUiOBVXAWU6Pi60=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=JDj68Vda9kv7c+Hs802YkQ5gntLl8bfOk/Ygrb2zhueZKrMDtoPL0ELekmFQlRucH
	 hOMM7wHtQrFI6KlKOdG3OcvKHFnFIDl8svvmXC2RBhqdtvpUjI5K5gZnhmGJIO+dji
	 hKftYkmg+C/oDf80i6A8/o3B+Q/0VpS/CPbLqr9M=
Subject: Re: [OE-core] [PATCH] elfutils: upgrade 0.183 -> 0.185
To: zangrc <zangrc.fnst@fujitsu.com>, openembedded-core@lists.openembedded.org
References: <1622525045-17496-1-git-send-email-zangrc.fnst@fujitsu.com>
From: "Alejandro Hernandez Samaniego" <alhe@linux.microsoft.com>
Message-ID: <93dc9cd1-2921-8c10-67de-7598c3a31262@linux.microsoft.com>
Date: Fri, 4 Jun 2021 11:00:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622525045-17496-1-git-send-email-zangrc.fnst@fujitsu.com>
Content-Type: multipart/alternative;
 boundary="------------11703E05B83C15C18D9762E8"
Content-Language: en-US

--------------11703E05B83C15C18D9762E8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/31/21 11:24 PM, zangrc wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-add-support-for-ipkg-to-debuginfod.cxx.patch
> Removed since this is included in 0.185.
>
> Refresh the following patch:
> 0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> 0015-config-eu.am-do-not-use-Werror.patch
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../{elfutils_0.183.bb => elfutils_0.185.bb}  |  5 +-
>   ...d-support-for-ipkg-to-debuginfod.cxx.patch | 33 -----------
>   ...infod-client.c-correct-string-format.patch | 56 +++++++------------
>   .../0015-config-eu.am-do-not-use-Werror.patch | 23 ++++----
>   4 files changed, 34 insertions(+), 83 deletions(-)
>   rename meta/recipes-devtools/elfutils/{elfutils_0.183.bb => elfutils_0.185.bb} (97%)
>   delete mode 100644 meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> similarity index 97%
> rename from meta/recipes-devtools/elfutils/elfutils_0.183.bb
> rename to meta/recipes-devtools/elfutils/elfutils_0.185.bb
> index 7aebaf1b6d..970cdcca60 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> @@ -21,16 +21,15 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
>              file://run-ptest \
>              file://ptest.patch \
>              file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
> -           file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch \
>              file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
>              "
>   SRC_URI_append_libc-musl = " \
>              file://0002-musl-libs.patch \
>              file://0003-musl-utils.patch \
>              file://0004-Fix-error-on-musl.patch \
> -           file://0015-config-eu.am-do-not-use-Werror.patch \
> +           file://0015-config-eu.am-do-not-use-Werror.patch \
>              "
> -SRC_URI[sha256sum] = "c3637c208d309d58714a51e61e63f1958808fead882e9b607506a29e5474f2c5"
> +SRC_URI[sha256sum] = "dc8d3e74ab209465e7f568e1b3bb9a5a142f8656e2b57d10049a73da2ae6b5a6"
>   
>   inherit autotools gettext ptest pkgconfig
>   
> diff --git a/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch b/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
> deleted file mode 100644
> index 5f82afef0c..0000000000
> --- a/meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 571416bf5b5ef319df6d9c79e46680920487e4a7 Mon Sep 17 00:00:00 2001
> -From: dorindabassey <dorindabassey@gmail.com>
> -Date: Sat, 19 Dec 2020 01:11:46 +0100
> -Subject: [PATCH] add support for ipkg to debuginfod.cxx
> -
> -added support for ipkg to the debuginfod scanner. 0.182 only supports RPM and scan .debs, with this patch, debuginfod scanner would be able to scan .ipk
> -
> -Upstream-status: Submitted [https://sourceware.org/pipermail/elfutils-devel/2020q4/003357.html]
> -
> -Signed-off-by: dorindabassey <dorindabassey@gmail.com>
> -
> ----
> - debuginfod/debuginfod.cxx | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
> -index b34eacc..a8915f2 100644
> ---- a/debuginfod/debuginfod.cxx
> -+++ b/debuginfod/debuginfod.cxx
> -@@ -484,11 +484,13 @@ parse_opt (int key, char *arg,
> -         {
> -           scan_archives[".deb"]="dpkg-deb --fsys-tarfile";
> -           scan_archives[".ddeb"]="dpkg-deb --fsys-tarfile";
> -+          scan_archives[".ipk"]="dpkg-deb --fsys-tarfile";
> -         }
> -       else
> -         {
> -           scan_archives[".deb"]="(bsdtar -O -x -f - data.tar.xz)<";
> -           scan_archives[".ddeb"]="(bsdtar -O -x -f - data.tar.xz)<";
> -+          scan_archives[".ipk"]="(bsdtar -O -x -f - data.tar.xz)<";
> -         }
> -       // .udeb too?
> -       break;
> diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> index 5bd6ba961c..6a16718538 100644
> --- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> +++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
> @@ -1,6 +1,6 @@
> -From 14dfe84943b8f9e6f504536d8735ef6356210b40 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Mon, 19 Apr 2021 23:29:10 +0200
> +From 7355a34d3796272e6213b676e042809686eb398a Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@fujitsu.com>
> +Date: Mon, 31 May 2021 17:38:30 +0900
>   Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on
>    32bit arches with 64bit time_t
>   
> @@ -17,58 +17,40 @@ Upstream-Status: Pending
>   Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   ---
> - debuginfod/debuginfod-client.c | 10 +++++-----
> - 1 file changed, 5 insertions(+), 5 deletions(-)
> + debuginfod/debuginfod-client.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
>   
>   diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
> -index de26af5..39e28f2 100644
> +index ee7eda2..9b26712 100644
>   --- a/debuginfod/debuginfod-client.c
>   +++ b/debuginfod/debuginfod-client.c
> -@@ -229,7 +229,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
> +@@ -267,7 +267,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
>      if (fd < 0)
>        return -errno;
>    
>   -  if (dprintf(fd, "%ld", cache_clean_default_interval_s) < 0)
> -+  if (dprintf(fd, "%jd", (intmax_t)cache_clean_default_interval_s) < 0)
> ++  if (dprintf(fd, "%ld", (intmax_t)cache_clean_default_interval_s) < 0)
>        return -errno;
>    
>      /* init max age config file.  */
> -@@ -237,7 +237,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
> +@@ -275,7 +275,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
>          && (fd = open(maxage_path, O_CREAT | O_RDWR, DEFFILEMODE)) < 0)
>        return -errno;
>    
>   -  if (dprintf(fd, "%ld", cache_default_max_unused_age_s) < 0)
> -+  if (dprintf(fd, "%jd", (intmax_t)cache_default_max_unused_age_s) < 0)
> ++  if (dprintf(fd, "%ld", (intmax_t)cache_default_max_unused_age_s) < 0)
>        return -errno;
>    
>      return 0;
> -@@ -263,7 +263,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> -       if (interval_file == NULL)
> -         return -errno;
> +@@ -303,7 +303,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> +   /* Check timestamp of interval file to see whether cleaning is necessary.  */
> +   if (time(NULL) - st.st_mtime < clean_interval)
> +     /* Interval has not passed, skip cleaning.  */
> +-    return 0;
> ++    return 0;/

Hi Wang,

Was this previous line change intended?


Alejandro

>    
> --      int rc = fprintf(interval_file, "%ld", cache_clean_default_interval_s);
> -+      int rc = fprintf(interval_file, "%jd", (intmax_t)cache_clean_default_interval_s);
> -       fclose(interval_file);
> -
> -       if (rc < 0)
> -@@ -275,7 +275,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> -   interval_file = fopen(interval_path, "r");
> -   if (interval_file)
> -     {
> --      if (fscanf(interval_file, "%ld", &clean_interval) != 1)
> -+      if (fscanf(interval_file, "%jd", (intmax_t*)(&clean_interval)) != 1)
> -         clean_interval = cache_clean_default_interval_s;
> -       fclose(interval_file);
> -     }
> -@@ -291,7 +291,7 @@ debuginfod_clean_cache(debuginfod_client *c,
> -   max_unused_file = fopen(max_unused_path, "r");
> -   if (max_unused_file)
> -     {
> --      if (fscanf(max_unused_file, "%ld", &max_unused_age) != 1)
> -+      if (fscanf(max_unused_file, "%jd", (intmax_t*)(&max_unused_age)) != 1)
> -         max_unused_age = cache_default_max_unused_age_s;
> -       fclose(max_unused_file);
> -     }
> +   /* Read max unused age value from config file.  */
> +   rc = debuginfod_config_cache(max_unused_path,
>   --
> -2.31.1
> +2.25.1
>   
> diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
> index 205362626d..1857b7010e 100644
> --- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
> +++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
> @@ -1,6 +1,6 @@
> -From dfe11e043cd8ea0b0f0252bcff9f5a6b98c0ecd3 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Mon, 22 Jun 2020 21:35:16 +0000
> +From 5226351f21f7011440c2f6acfec50fbfd69796e4 Mon Sep 17 00:00:00 2001
> +From: Wang Mingyu <wangmy@fujitsu.com>
> +Date: Tue, 1 Jun 2021 11:02:10 +0900
>   Subject: [PATCH] config/eu.am: do not use -Werror
>   
>   Due to re-definition of error() on musl, gcc starts throwing
> @@ -16,22 +16,25 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>    1 file changed, 2 deletions(-)
>   
>   diff --git a/config/eu.am b/config/eu.am
> -index 6c3c444..3bc0dc9 100644
> +index 2c3e457..8fb0411 100644
>   --- a/config/eu.am
>   +++ b/config/eu.am
> -@@ -73,7 +73,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
> - 	    -Wold-style-definition -Wstrict-prototypes -Wtrampolines \
> +@@ -89,7 +89,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
> + 	    -Wold-style-definition -Wstrict-prototypes $(TRAMPOLINES_WARNING) \
>    	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
>    	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
>   -	    $(if $($(*F)_no_Werror),,-Werror) \
>    	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
>    	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
> - 	    $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
> -@@ -83,7 +82,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
> - 	   -Wtrampolines \
> + 	    $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
> +@@ -99,7 +98,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
> + 	   $(TRAMPOLINES_WARNING) \
>    	   $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
>    	   $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
>   -	   $(if $($(*F)_no_Werror),,-Werror) \
>    	   $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
>    	   $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
> - 	   $(if $($(*F)_no_Wpacked_not_aligned),-Wno-packed-not-aligned,) \
> + 	   $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
> +--
> +2.25.1
> +
>
> 
>

--------------11703E05B83C15C18D9762E8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/31/21 11:24 PM, zangrc wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1622525045-17496-1-git-send-email-zangrc.fnst@fujitsu.com">
      <pre class="moz-quote-pre" wrap="">From: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>

0001-add-support-for-ipkg-to-debuginfod.cxx.patch
Removed since this is included in 0.185.

Refresh the following patch:
0001-debuginfod-debuginfod-client.c-correct-string-format.patch
0015-config-eu.am-do-not-use-Werror.patch

Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
---
 .../{elfutils_0.183.bb =&gt; elfutils_0.185.bb}  |  5 +-
 ...d-support-for-ipkg-to-debuginfod.cxx.patch | 33 -----------
 ...infod-client.c-correct-string-format.patch | 56 +++++++------------
 .../0015-config-eu.am-do-not-use-Werror.patch | 23 ++++----
 4 files changed, 34 insertions(+), 83 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.183.bb =&gt; elfutils_0.185.bb} (97%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-add-support-for-ipkg-to-debuginfod.cxx.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.183.bb b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
similarity index 97%
rename from meta/recipes-devtools/elfutils/elfutils_0.183.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.185.bb
index 7aebaf1b6d..970cdcca60 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.183.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
@@ -21,16 +21,15 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2\file://run-ptest\file://ptest.patch\file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch\-file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch\file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch\">"https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
-           file://0001-add-support-for-ipkg-to-debuginfod.cxx.patch \
            file://0001-debuginfod-debuginfod-client.c-correct-string-format.patch \
            "</a>
 SRC_URI_append_libc-musl = " \
            <a class="moz-txt-link-freetext" href="file://0002-musl-libs.patch">file://0002-musl-libs.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0003-musl-utils.patch">file://0003-musl-utils.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0004-Fix-error-on-musl.patch">file://0004-Fix-error-on-musl.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0015-config-eu.am-do-not-use-Werror.patch">file://0015-config-eu.am-do-not-use-Werror.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://0015-config-eu.am-do-not-use-Werror.patch">file://0015-config-eu.am-do-not-use-Werror.patch</a> \ 
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
-From: dorindabassey <a class="moz-txt-link-rfc2396E" href="mailto:dorindabassey@gmail.com">&lt;dorindabassey@gmail.com&gt;</a>
-Date: Sat, 19 Dec 2020 01:11:46 +0100
-Subject: [PATCH] add support for ipkg to debuginfod.cxx
-
-added support for ipkg to the debuginfod scanner. 0.182 only supports RPM and scan .debs, with this patch, debuginfod scanner would be able to scan .ipk
-
-Upstream-status: Submitted [<a class="moz-txt-link-freetext" href="https://sourceware.org/pipermail/elfutils-devel/2020q4/003357.html">https://sourceware.org/pipermail/elfutils-devel/2020q4/003357.html</a>]
-
-Signed-off-by: dorindabassey <a class="moz-txt-link-rfc2396E" href="mailto:dorindabassey@gmail.com">&lt;dorindabassey@gmail.com&gt;</a>
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
-           scan_archives[".deb"]="(bsdtar -O -x -f - data.tar.xz)&lt;";
-           scan_archives[".ddeb"]="(bsdtar -O -x -f - data.tar.xz)&lt;";
-+          scan_archives[".ipk"]="(bsdtar -O -x -f - data.tar.xz)&lt;";
-         }
-       // .udeb too?
-       break;
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
index 5bd6ba961c..6a16718538 100644
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
+++ b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-correct-string-format.patch
@@ -1,6 +1,6 @@
-From 14dfe84943b8f9e6f504536d8735ef6356210b40 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
-Date: Mon, 19 Apr 2021 23:29:10 +0200
+From 7355a34d3796272e6213b676e042809686eb398a Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
+Date: Mon, 31 May 2021 17:38:30 +0900
 Subject: [PATCH] debuginfod/debuginfod-client.c: correct string format on
  32bit arches with 64bit time_t
 
@@ -17,58 +17,40 @@ Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
 Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
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
    if (fd &lt; 0)
      return -errno;
  
 -  if (dprintf(fd, "%ld", cache_clean_default_interval_s) &lt; 0)
-+  if (dprintf(fd, "%jd", (intmax_t)cache_clean_default_interval_s) &lt; 0)
++  if (dprintf(fd, "%ld", (intmax_t)cache_clean_default_interval_s) &lt; 0)
      return -errno;
  
    /* init max age config file.  */
-@@ -237,7 +237,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
+@@ -275,7 +275,7 @@ debuginfod_init_cache (char *cache_path, char *interval_path, char *maxage_path)
        &amp;&amp; (fd = open(maxage_path, O_CREAT | O_RDWR, DEFFILEMODE)) &lt; 0)
      return -errno;
  
 -  if (dprintf(fd, "%ld", cache_default_max_unused_age_s) &lt; 0)
-+  if (dprintf(fd, "%jd", (intmax_t)cache_default_max_unused_age_s) &lt; 0)
++  if (dprintf(fd, "%ld", (intmax_t)cache_default_max_unused_age_s) &lt; 0)
      return -errno;
  
    return 0;
-@@ -263,7 +263,7 @@ debuginfod_clean_cache(debuginfod_client *c,
-       if (interval_file == NULL)
-         return -errno;
+@@ -303,7 +303,7 @@ debuginfod_clean_cache(debuginfod_client *c,
+   /* Check timestamp of interval file to see whether cleaning is necessary.  */
+   if (time(NULL) - st.st_mtime &lt; clean_interval)
+     /* Interval has not passed, skip cleaning.  */
+-    return 0;
++    return 0;/</pre>
    </blockquote>
    <p>Hi Wang,</p>
    <p>Was this previous line change intended?</p>
    <p><br>
    </p>
    <p>Alejandro<br>
    </p>
    <blockquote type="cite"
      cite="mid:1622525045-17496-1-git-send-email-zangrc.fnst@fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
  
--      int rc = fprintf(interval_file, "%ld", cache_clean_default_interval_s);
-+      int rc = fprintf(interval_file, "%jd", (intmax_t)cache_clean_default_interval_s);
-       fclose(interval_file);
- 
-       if (rc &lt; 0)
-@@ -275,7 +275,7 @@ debuginfod_clean_cache(debuginfod_client *c,
-   interval_file = fopen(interval_path, "r");
-   if (interval_file)
-     {
--      if (fscanf(interval_file, "%ld", &amp;clean_interval) != 1)
-+      if (fscanf(interval_file, "%jd", (intmax_t*)(&amp;clean_interval)) != 1)
-         clean_interval = cache_clean_default_interval_s;
-       fclose(interval_file);
-     }
-@@ -291,7 +291,7 @@ debuginfod_clean_cache(debuginfod_client *c,
-   max_unused_file = fopen(max_unused_path, "r");
-   if (max_unused_file)
-     {
--      if (fscanf(max_unused_file, "%ld", &amp;max_unused_age) != 1)
-+      if (fscanf(max_unused_file, "%jd", (intmax_t*)(&amp;max_unused_age)) != 1)
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
-From: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
-Date: Mon, 22 Jun 2020 21:35:16 +0000
+From 5226351f21f7011440c2f6acfec50fbfd69796e4 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
+Date: Tue, 1 Jun 2021 11:02:10 +0900
 Subject: [PATCH] config/eu.am: do not use -Werror
 
 Due to re-definition of error() on musl, gcc starts throwing
@@ -16,22 +16,25 @@ Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
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
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------11703E05B83C15C18D9762E8--
