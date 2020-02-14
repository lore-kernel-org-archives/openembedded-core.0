Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB216100E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 07:34:30 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j9so4445076pfa.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 23:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=a5Qvp+B40KDa7qaB28MPX9XtzGJSPah+s/di1ss5ZH0=;
	b=XZ3JbUjFJPHgNiYCfNYLgHK3qdk4AQduCvgMb78E/6ZciV9aPMFrTrENlC7+MVys8C
	RfmClAr80UNPvBIdncYIKn31dYc9kGQfgKRPBTtxShwuja7MGHWhd4DXSth4BP3tYP8X
	Vp78QRLElhcm7Xl6nymoY2RTqn+83/S8uX9z5kWBvjjhDE3RGdjGaVAOiPUbQblnlndD
	Ddh32g0DFAPvWXFt8WIkE8aKeDhyKvMYdTSIme0dy5RVyffmC/9jXYW85fBVVEcYcMIQ
	eGjMWbwvYuEbUhF8Mu0FIvHrdQar7f6MUng8IsgvBcfogDPp/sAp96PUgrNcJ/RyBuC/
	eUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=a5Qvp+B40KDa7qaB28MPX9XtzGJSPah+s/di1ss5ZH0=;
	b=l7pQRkTqJADEyBhztATJmgktZVOIaf4aRjP8j5bFT4njlsmFw/vtUkn2NtM+BNAfP5
	WuKH/5e51VnnpliRZgke+09j714SzGX1nQt/rAzqFB0J9Sy7g5BSHNbizYY7Urg+xjTh
	r2kNWFAL+LYUABp3Xm5AmgFVgvWKCL4iOTBGVTKUcyjEtdyV4sbRCXqmmkRvqJ/Prgnw
	u60k/4k2qy3K7ESXfv/PMXk7zkFaCFaOB411HdqumlkGd0eO2KHHIEIUaSdpKNzwc5ZO
	DGU6P+PuK+Q4ThqWxHVtCz9ODkY9QUr3qT/ogcMMIIiNTnH7Q4KENL3+yK9r7oj9KBkB
	y0qQ==
X-Gm-Message-State: APjAAAX3GPXM5B+I+jmGxWlksI1pjDPI1/KQrY+eea0jMyw8eL3O5Ygb
	xsH+byM5+ijITSvbAYfa7COkBVc76Z8=
X-Google-Smtp-Source: APXvYqyAwnoRIk0kWs2YQNepVpMmhRON1rGvq5+MTKvxAMIAPCWYU2OQt6wFizssF1wQKbRHaVqt2g==
X-Received: by 2002:aa7:82d5:: with SMTP id f21mr2098851pfn.245.1581665670101; 
	Thu, 13 Feb 2020 23:34:30 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:e46f:82cf:7841:c431?
	([2601:646:9200:4e0:e46f:82cf:7841:c431])
	by smtp.gmail.com with ESMTPSA id
	j14sm5603476pgs.57.2020.02.13.23.34.29
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 13 Feb 2020 23:34:29 -0800 (PST)
To: Jens Rehsack <sno@netbsd.org>, openembedded-core@lists.openembedded.org
References: <20200213133616.19507-1-sno@netbsd.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <29a7abd1-5516-a965-39c6-d63d7c568c03@gmail.com>
Date: Thu, 13 Feb 2020 23:34:28 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200213133616.19507-1-sno@netbsd.org>
Subject: Re: [RESEND PATCH v2] make: 4.2.1 -> 4.3
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
X-List-Received-Date: Fri, 14 Feb 2020 07:34:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/13/20 5:36 AM, Jens Rehsack wrote:
> Announcement: https://lists.gnu.org/archive/html/bug-make/2020-01/msg00057.html
> 
> 1) Remove upstream provided patches 0001-glob-Do-not-assume-glibc-glob-internals.patch
>     and 0002-glob-Do-not-assume-glibc-glob-internals.patch.
> 
> 2) License has been changed to GPLv3 only
> 
> 3) Important bug-fix is
>     * https://lists.gnu.org/archive/html/bug-make/2018-09/msg00006.html
> 
> 4) Backward-incompatibilities:
>     * Number signs (#) appearing inside a macro reference or function invocation
>       no longer introduce comments and should not be escaped with backslashes
>     * Previously appending using '+=' to an empty variable would result in a value
>       starting with a space.  Now the initial space is only added if the variable
>       already contains some value.  Similarly, appending an empty string does not
>       add a trailing space.
> 

Just assessing forward port work this will ensue, did you try some world 
builds ?


> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>   meta/recipes-devtools/make/make.inc           |  4 +-
>   ...b-Do-not-assume-glibc-glob-internals.patch | 70 -------------------
>   ...b-Do-not-assume-glibc-glob-internals.patch | 38 ----------
>   meta/recipes-devtools/make/make_4.2.1.bb      | 12 ----
>   meta/recipes-devtools/make/make_4.3.bb        | 10 +++
>   5 files changed, 11 insertions(+), 123 deletions(-)
>   delete mode 100644 meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
>   delete mode 100644 meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
>   delete mode 100644 meta/recipes-devtools/make/make_4.2.1.bb
>   create mode 100644 meta/recipes-devtools/make/make_4.3.bb
> 
> diff --git a/meta/recipes-devtools/make/make.inc b/meta/recipes-devtools/make/make.inc
> index b8905bc6d3..4142cf23d3 100644
> --- a/meta/recipes-devtools/make/make.inc
> +++ b/meta/recipes-devtools/make/make.inc
> @@ -5,9 +5,7 @@ called the makefile, which lists each of the non-source files and how to compute
>   HOMEPAGE = "http://www.gnu.org/software/make/"
>   SECTION = "devel"
>   
> -SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2 \
> -           file://0001-glob-Do-not-assume-glibc-glob-internals.patch \
> -           file://0002-glob-Do-not-assume-glibc-glob-internals.patch \
> +SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.lz \
>              "
>   
>   inherit autotools gettext pkgconfig texinfo
> diff --git a/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch b/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
> deleted file mode 100644
> index 2b6e4d40c3..0000000000
> --- a/meta/recipes-devtools/make/make/0001-glob-Do-not-assume-glibc-glob-internals.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -From c90a7dda6c572f79b8e78da44b6ebf8704edef65 Mon Sep 17 00:00:00 2001
> -From: Paul Eggert <eggert@cs.ucla.edu>
> -Date: Sun, 24 Sep 2017 09:12:58 -0400
> -Subject: [PATCH 1/2] glob: Do not assume glibc glob internals.
> -
> -It has been proposed that glibc glob start using gl_lstat,
> -which the API allows it to do.  GNU 'make' should not get in
> -the way of this.  See:
> -https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
> -
> -* dir.c (local_lstat): New function, like local_stat.
> -(dir_setup_glob): Use it to initialize gl_lstat too, as the API
> -requires.
> ----
> -Upstream-Status: Backport
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> - dir.c | 29 +++++++++++++++++++++++++++--
> - 1 file changed, 27 insertions(+), 2 deletions(-)
> -
> -diff --git a/dir.c b/dir.c
> -index f34bbf5..12eef30 100644
> ---- a/dir.c
> -+++ b/dir.c
> -@@ -1299,15 +1299,40 @@ local_stat (const char *path, struct stat *buf)
> - }
> - #endif
> -
> -+/* Similarly for lstat.  */
> -+#if !defined(lstat) && !defined(WINDOWS32) || defined(VMS)
> -+# ifndef VMS
> -+#  ifndef HAVE_SYS_STAT_H
> -+int lstat (const char *path, struct stat *sbuf);
> -+#  endif
> -+# else
> -+    /* We are done with the fake lstat.  Go back to the real lstat */
> -+#   ifdef lstat
> -+#     undef lstat
> -+#   endif
> -+# endif
> -+# define local_lstat lstat
> -+#elif defined(WINDOWS32)
> -+/* Windows doesn't support lstat().  */
> -+# define local_lstat local_stat
> -+#else
> -+static int
> -+local_lstat (const char *path, struct stat *buf)
> -+{
> -+  int e;
> -+  EINTRLOOP (e, lstat (path, buf));
> -+  return e;
> -+}
> -+#endif
> -+
> - void
> - dir_setup_glob (glob_t *gl)
> - {
> -   gl->gl_opendir = open_dirstream;
> -   gl->gl_readdir = read_dirstream;
> -   gl->gl_closedir = free;
> -+  gl->gl_lstat = local_lstat;
> -   gl->gl_stat = local_stat;
> --  /* We don't bother setting gl_lstat, since glob never calls it.
> --     The slot is only there for compatibility with 4.4 BSD.  */
> - }
> -
> - void
> ---
> -2.16.1
> -
> diff --git a/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch b/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
> deleted file mode 100644
> index d49acd9f6e..0000000000
> --- a/meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -From 9858702dbd1e137262c06765919937660879f63c Mon Sep 17 00:00:00 2001
> -From: Paul Eggert <eggert@cs.ucla.edu>
> -Date: Sun, 24 Sep 2017 09:12:58 -0400
> -Subject: [PATCH 2/2] glob: Do not assume glibc glob internals.
> -
> -It has been proposed that glibc glob start using gl_lstat,
> -which the API allows it to do.  GNU 'make' should not get in
> -the way of this.  See:
> -https://sourceware.org/ml/libc-alpha/2017-09/msg00409.html
> -
> -* dir.c (local_lstat): New function, like local_stat.
> -(dir_setup_glob): Use it to initialize gl_lstat too, as the API
> -requires.
> ----
> -Upstream-Status: Backport
> -
> - configure.ac | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 64ec870..e87901c 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -399,10 +399,9 @@ AC_CACHE_CHECK([if system libc has GNU glob], [make_cv_sys_gnu_glob],
> - #include <glob.h>
> - #include <fnmatch.h>
> -
> --#define GLOB_INTERFACE_VERSION 1
> - #if !defined _LIBC && defined __GNU_LIBRARY__ && __GNU_LIBRARY__ > 1
> - # include <gnu-versions.h>
> --# if _GNU_GLOB_INTERFACE_VERSION == GLOB_INTERFACE_VERSION
> -+if _GNU_GLOB_INTERFACE_VERSION == 1 || _GNU_GLOB_INTERFACE_VERSION == 2
> -    gnu glob
> - # endif
> - #endif],
> ---
> -2.16.1
> -
> diff --git a/meta/recipes-devtools/make/make_4.2.1.bb b/meta/recipes-devtools/make/make_4.2.1.bb
> deleted file mode 100644
> index c6e6a0cd58..0000000000
> --- a/meta/recipes-devtools/make/make_4.2.1.bb
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -LICENSE = "GPLv3 & LGPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> -                    file://tests/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> -                    file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
> -require make.inc
> -
> -EXTRA_OECONF += "--without-guile"
> -
> -SRC_URI[md5sum] = "15b012617e7c44c0ed482721629577ac"
> -SRC_URI[sha256sum] = "d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/make/make_4.3.bb b/meta/recipes-devtools/make/make_4.3.bb
> new file mode 100644
> index 0000000000..a3eb9d92f2
> --- /dev/null
> +++ b/meta/recipes-devtools/make/make_4.3.bb
> @@ -0,0 +1,10 @@
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +require make.inc
> +
> +EXTRA_OECONF += "--without-guile"
> +
> +SRC_URI[md5sum] = "d5c40e7bd1e97a7404f5d3be982f479a"
> +SRC_URI[sha256sum] = "de1a441c4edf952521db30bfca80baae86a0ff1acd0a00402999344f04c45e82"
> +
> +BBCLASSEXTEND = "native nativesdk"
> 


