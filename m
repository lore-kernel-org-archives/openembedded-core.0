Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.6551.1588431258416073792
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 07:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Nlf6n88y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id d17so15326962wrg.11
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=saGYWHtX7XhX0SwAeIOA8UwJId8jEcV9WcVFRTPjZJc=;
        b=Nlf6n88y2dh+PD8HGNBnwVUoy8B7pb9CAoCBAvpHqpasdAm6KTyyV3Vdw7TfDc2z1v
         3STS0NrM/eU4byOvkvhebavU4xJJHCNYdND8clC1OfHVDonh7y2YWOqMAC1FHr0OPYXY
         vFOtFeVBO5ZfiaSwIBjEjqeCK1kMNLUYO8PcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=saGYWHtX7XhX0SwAeIOA8UwJId8jEcV9WcVFRTPjZJc=;
        b=dmN5YiV0h97/WzKDugiTnL99DTGb+TnQTA3zZYw9mDUIBADHd7rM9fP0T3YAuOvRDY
         hzb5b5ZrYWAgiV88SZpBxjurHByWbc70pQUnpXiIhef3omX0gMMA2jpO6NxDaZ+QHvk5
         om0urVT7zq+ouGJjyYw3dtdhh3ch8TRy9LpnsfwZOSSh9n+udl0Rfwwihs6HRVAXr0Dn
         AcV1A9wByfPBOo1e+QpqfeQO1AvdFiX3u2alq2n9VF1AbAFbZdFssI0YF9o5Nmdul1kJ
         jZUx9cjkn46nGGhaYlEdkLpXb46J9QPVEyiqI+FCy6JKLZvAwaE+knk+JOo1kQ05VpSk
         Q7qA==
X-Gm-Message-State: AGi0PuacUYC1DcFtXtg7CxnUhVxStohm1wpbCOurxK5BvQ3l0hbholrd
	W9JQUzexR/YHcnesxFCSFmK4qKwzuko=
X-Google-Smtp-Source: APiQypLlCxXAoElF9x0hoXRwNy9LLFTU5MuxplwZOPhcQdf6t2uWYMAOw3+oL2jaZ1QguytNb1wozA==
X-Received: by 2002:adf:d088:: with SMTP id y8mr9122174wrh.23.1588431255546;
        Sat, 02 May 2020 07:54:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g74sm4567599wme.44.2020.05.02.07.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 07:54:14 -0700 (PDT)
Message-ID: <5a21ea78ab23ff8daa04a43f5f2dd79e98f8b582.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 14/17] coreutils: update to 8.32
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 02 May 2020 15:54:13 +0100
In-Reply-To: <20200430095815.2824-14-alex.kanavin@gmail.com>
References: <20200430095815.2824-1-alex.kanavin@gmail.com>
	 <20200430095815.2824-14-alex.kanavin@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-30 at 11:58 +0200, Alexander Kanavin wrote:
> License-Update: copyright years, http changed to https
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../coreutils/fix-selinux-flask.patch         | 13 ++++-------
>  .../remove-usr-local-lib-from-m4.patch        | 23 ++++++++++++++---
> --
>  .../strtod_fix_clash_with_strtold.patch       | 10 +++-----
>  .../{coreutils_8.31.bb => coreutils_8.32.bb}  | 11 +++++----
>  4 files changed, 31 insertions(+), 26 deletions(-)
>  rename meta/recipes-core/coreutils/{coreutils_8.31.bb =>
> coreutils_8.32.bb} (95%)
> 
> diff --git a/meta/recipes-core/coreutils/coreutils/fix-selinux-
> flask.patch b/meta/recipes-core/coreutils/coreutils/fix-selinux-
> flask.patch
> index 9d1ae55d47..173a57925b 100644
> --- a/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch
> +++ b/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch
> @@ -1,4 +1,4 @@
> -From a1d360509fa3a4aff57eedcd528cc0347a87531d Mon Sep 17 00:00:00
> 2001
> +From 7e20a7242ba2657f73311bbf5278093da67f0721 Mon Sep 17 00:00:00
> 2001
>  From: Robert Yang <liezhi.yang@windriver.com>
>  Date: Tue, 16 Sep 2014 01:59:08 -0700
>  Subject: [PATCH] gnulib-comp.m4: selinux/flask.h should respect to
> @@ -13,20 +13,20 @@ compilation terminated.
>  Upstream-Status: Pending
>  
>  Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +
>  ---
> - m4/gnulib-comp.m4 |    2 +-
> + m4/gnulib-comp.m4 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  
>  diff --git a/m4/gnulib-comp.m4 b/m4/gnulib-comp.m4
> -index 472d3a0..5f09734 100644
> +index dead90e..0abf0bd 100644
>  --- a/m4/gnulib-comp.m4
>  +++ b/m4/gnulib-comp.m4
> -@@ -1730,11 +1730,11 @@ AC_DEFUN([gl_INIT],
> +@@ -1860,10 +1860,10 @@ AC_DEFUN([gl_INIT],
>       AC_LIBOBJ([select])
>     fi
>     gl_SYS_SELECT_MODULE_INDICATOR([select])
>  -  AC_CHECK_HEADERS([selinux/flask.h])
> -   AC_LIBOBJ([selinux-at])
>     gl_HEADERS_SELINUX_SELINUX_H
>     gl_HEADERS_SELINUX_CONTEXT_H
>     if test "$with_selinux" != no && test
> "$ac_cv_header_selinux_selinux_h" = yes; then
> @@ -34,6 +34,3 @@ index 472d3a0..5f09734 100644
>       AC_LIBOBJ([getfilecon])
>     fi
>     gl_SERVENT
> --- 
> -1.7.9.5
> -
> diff --git a/meta/recipes-core/coreutils/coreutils/remove-usr-local-
> lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils/remove-usr-
> local-lib-from-m4.patch
> index 2ef8a548ac..1a8a9b9983 100644
> --- a/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-
> from-m4.patch
> +++ b/meta/recipes-core/coreutils/coreutils/remove-usr-local-lib-
> from-m4.patch
> @@ -1,3 +1,8 @@
> +From a26530083a29eeee910bfd606ecc621acecd547a Mon Sep 17 00:00:00
> 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 3 Aug 2011 14:12:30 -0700
> +Subject: [PATCH] coreutils: Fix build on uclibc
> +
>  We have problem using hardcoded directories like /usr/local here
>  which will be checked for cross builds. This is a special case which
>  is valid for AIX only. We do not have AIX as one of our supported
> @@ -8,11 +13,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  
>  Upstream-Status: Inappropriate [Upstream does care for AIX while we
> may not]
>  
> -Index: coreutils-8.14/m4/getloadavg.m4
> -===================================================================
> ---- coreutils-8.14.orig/m4/getloadavg.m4	2011-09-19
> 08:09:24.000000000 -0700
> -+++ coreutils-8.14/m4/getloadavg.m4	2011-10-19 21:42:00.385533357
> -0700
> -@@ -41,16 +41,6 @@
> +---
> + m4/getloadavg.m4 | 12 ------------
> + 1 file changed, 12 deletions(-)
> +
> +diff --git a/m4/getloadavg.m4 b/m4/getloadavg.m4
> +index 8e96965..63782a2 100644
> +--- a/m4/getloadavg.m4
> ++++ b/m4/getloadavg.m4
> +@@ -41,18 +41,6 @@ AC_CHECK_FUNC([getloadavg], [],
>          [LIBS="-lutil $LIBS" gl_func_getloadavg_done=yes])
>      fi
>   
> @@ -20,7 +29,9 @@ Index: coreutils-8.14/m4/getloadavg.m4
>  -     # There is a commonly available library for RS/6000 AIX.
>  -     # Since it is not a standard part of AIX, it might be
> installed locally.
>  -     gl_getloadavg_LIBS=$LIBS
> --     LIBS="-L/usr/local/lib $LIBS"
> +-     if test $cross_compiling != yes; then
> +-       LIBS="-L/usr/local/lib $LIBS"
> +-     fi
>  -     AC_CHECK_LIB([getloadavg], [getloadavg],
>  -                  [LIBS="-lgetloadavg $LIBS"
> gl_func_getloadavg_done=yes],
>  -                  [LIBS=$gl_getloadavg_LIBS])
> diff --git a/meta/recipes-
> core/coreutils/coreutils/strtod_fix_clash_with_strtold.patch
> b/meta/recipes-
> core/coreutils/coreutils/strtod_fix_clash_with_strtold.patch
> index 77770093cd..fd629a5d2a 100644
> --- a/meta/recipes-
> core/coreutils/coreutils/strtod_fix_clash_with_strtold.patch
> +++ b/meta/recipes-
> core/coreutils/coreutils/strtod_fix_clash_with_strtold.patch
> @@ -1,4 +1,4 @@
> -From 0562b040fa17f1722ba2b3096067b45d0582ca53 Mon Sep 17 00:00:00
> 2001
> +From 134137671bd771bf0205b87a735c545dbcdbb4b3 Mon Sep 17 00:00:00
> 2001
>  From: Paul Eggert <eggert@cs.ucla.edu>
>  Date: Mon, 11 Mar 2019 16:40:29 -0700
>  Subject: [PATCH] strtod: fix clash with strtold
> @@ -14,12 +14,11 @@ Upstream-Status: Backport [rhel5]
>  Signed-off-by: Oleksandr Kravchuk <
> open.source@oleksandr-kravchuk.com>
>  
>  ---
> - ChangeLog    |  9 +++++++++
>   lib/strtod.c | 11 +++++------
> - 2 files changed, 14 insertions(+), 6 deletions(-)
> + 1 file changed, 5 insertions(+), 6 deletions(-)
>  
>  diff --git a/lib/strtod.c b/lib/strtod.c
> -index b9eaa51b4..69b1564e1 100644
> +index b9eaa51..69b1564 100644
>  --- a/lib/strtod.c
>  +++ b/lib/strtod.c
>  @@ -294,16 +294,15 @@ parse_number (const char *nptr,
> @@ -51,6 +50,3 @@ index b9eaa51b4..69b1564e1 100644
>  +    return minus_zero ();
>     return negative ? -num : num;
>   }
> --- 
> -2.20.1
> -
> diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb
> b/meta/recipes-core/coreutils/coreutils_8.32.bb
> similarity index 95%
> rename from meta/recipes-core/coreutils/coreutils_8.31.bb
> rename to meta/recipes-core/coreutils/coreutils_8.32.bb
> index 2b196b7512..70d02bbb07 100644
> --- a/meta/recipes-core/coreutils/coreutils_8.31.bb
> +++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
> @@ -5,8 +5,9 @@ every system."
>  HOMEPAGE = "http://www.gnu.org/software/coreutils/"
>  BUGTRACKER = "http://debbugs.gnu.org/coreutils"
>  LICENSE = "GPLv3+"
> -LIC_FILES_CHKSUM =
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
> -                    file://src/ls.c;beginline=1;endline=15;md5=c456f
> 9896277a0543e3866777ccc0255"
> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
> +                    file://src/ls.c;beginline=1;endline=15;md5=b7d80
> abf5b279320fb0e4b1007ed108b \
> +                    "
>  DEPENDS = "gmp libcap"
>  DEPENDS_class-native = ""
>  
> @@ -19,12 +20,12 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
>             file://disable-ls-output-quoting.patch \
>             file://0001-local.mk-fix-cross-compiling-problem.patch \
>             file://run-ptest \
> -          "
> +           "
>  
>  SRC_URI_append_libc-musl =
> "file://strtod_fix_clash_with_strtold.patch"

Musl specific failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1840



