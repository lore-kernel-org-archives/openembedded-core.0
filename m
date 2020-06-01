Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.41924.1591030589115076429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 09:56:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d74UQAsl;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id y1so8203137qtv.12
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 09:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z5SGeHEdrociRE1C5ue+XlbNh+n4DJcee/zUyJkPqUI=;
        b=d74UQAslHzIDyWRm1fhJrbFQ7FkuDp7CUtOwl27AjqSky5dle8Am0VuaDp82UkApRU
         74O0/PdFqhwGYBXlcHbS9vy2if6l5u2lgw7Ayl0GJODkl7jxJhFs2jsuy/I9yxnO9vmO
         0K5bWimTrH+3HzRzkij/zqiRKqHJSRtZZrQPfJmG57IdLZBSllOjyM138+ghdf9sfQhs
         LPfFLEX9paB1VOMmPCIa2CFvI2P06mIIYH52wMqQ+LSSyA0lGnka0B9wntZKpQCVunVT
         zvn9XcxNpP3iRS4zVhP+Fu9euOUFF7aTcqcrkQIEEZ5mRu0LGu8H7eaNQGXZ9JcvdsUx
         csYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z5SGeHEdrociRE1C5ue+XlbNh+n4DJcee/zUyJkPqUI=;
        b=ZsToRKX/AxH9a6mFK+3tjj0HSlNR4BfQh43O6S8/hqxYMPSO59LrgZ/NpSsYax/qFP
         p7fZo2IG2x6rCp3jWAB8dwaN/1bxWLpWKcv7cQFwe1WgEPzKQbbCFk1kf1XNF5QMYG33
         ecko56rcY8f3Mi1gXTWGFcYUMYH+Vh+qrgN8oaolOntuUtG7l5yqC+nfotoJGz6ySphh
         GTQGDSJzMFDPVdqe6zhxMOZ4wHSUnQVJYRv2KOs+AyRLrvYUNVSCXQ8SOr7XnUqBcu3T
         igOdl8UWTH2fLigvt3tBTlA+ICouTphxWoEJdfVvnXGZAAP1DW0glz4ewhqhE5IIlduO
         zlmg==
X-Gm-Message-State: AOAM531sAfyqOOykpl4+sesyXFAaw0NRoWJxxe6sZT8JuedQf1oAtGMK
	QzUtl8DGxs9ZAt2zcR18GUODtQCKJAPFyO38AIY=
X-Google-Smtp-Source: ABdhPJxWGUUh+9wso4g5zfPwwPJIE01j+3oF5Z93ap35zFFS9rdxxhUah68+OoapjsC6fj5r6qdjVwdDh7MUeF0rjWg=
X-Received: by 2002:aed:3b62:: with SMTP id q31mr23476430qte.293.1591030588111;
 Mon, 01 Jun 2020 09:56:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200531155254.10283-1-alex.kanavin@gmail.com> <20200531155254.10283-57-alex.kanavin@gmail.com>
In-Reply-To: <20200531155254.10283-57-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 1 Jun 2020 09:56:02 -0700
Message-ID: <CAMKF1srHEXb8Qmp_AEydLmnKrF=+C4vZS4g_3B9RK_jHzFNtRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 57/70] json-c: update 0.13.1 - > 0.14
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This breaks  multipath-tools see
https://errors.yoctoproject.org/Errors/Details/414875/

perhaps https://www.spinics.net/lists/dm-devel/msg40646.html is now
required for  multipath-tools

On Sun, May 31, 2020 at 8:55 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...d-disable-werror-option-to-configure.patch | 45 -------------------
>  .../{json-c_0.13.1.bb => json-c_0.14.bb}      | 11 ++---
>  2 files changed, 3 insertions(+), 53 deletions(-)
>  delete mode 100644 meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
>  rename meta/recipes-devtools/json-c/{json-c_0.13.1.bb => json-c_0.14.bb} (67%)
>
> diff --git a/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch b/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
> deleted file mode 100644
> index 0c20c8458a..0000000000
> --- a/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -json-c: Backport --disable-werror patch to allow compilation under icecc
> -
> -icecc preprocesses source files locally before shipping them off to be compiled
> -on remote hosts. This preprocessing removes comments, including /* fallthough */
> -comments in switch statements that normally prevent an implicit-fallthrough
> -warning, see https://github.com/icecc/icecream/issues/419
> -
> -Rather than turning off -Werror, the upstream project has implemented a
> -configure option, --disable-werror, in response to Ross's
> -https://github.com/json-c/json-c/issues/489
> -
> -This patch from
> -https://github.com/json-c/json-c/commit/21c886534f8927fdc0fb5f8647394f3e0e0874b8
> -
> -Upstream-Status: Backport [Not yet released]
> -Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
> -
> -From 21c886534f8927fdc0fb5f8647394f3e0e0874b8 Mon Sep 17 00:00:00 2001
> -From: Pierce Lopez <pierce.lopez@gmail.com>
> -Date: Sun, 9 Jun 2019 10:52:08 -0400
> -Subject: [PATCH] build: add --disable-werror option to configure
> -
> -to omit -Werror compiler option
> ----
> - configure.ac | 7 ++++++-
> - 1 file changed, 6 insertions(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 272ea6af9c..798fd5b747 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -165,7 +165,12 @@ AS_IF([test "x$enable_Bsymbolic" = "xcheck"],
> - AS_IF([test "x$enable_Bsymbolic" = "xyes"], [JSON_BSYMBOLIC_LDFLAGS=-Wl[,]-Bsymbolic-functions])
> - AC_SUBST(JSON_BSYMBOLIC_LDFLAGS)
> -
> --AX_APPEND_COMPILE_FLAGS([-Wall -Werror -Wcast-qual -Wno-error=deprecated-declarations])
> -+AC_ARG_ENABLE([werror],
> -+    AS_HELP_STRING([--disable-werror], [avoid treating compiler warnings as fatal errors]))
> -+
> -+AS_IF([test "x$enable_werror" != "xno"], [AX_APPEND_COMPILE_FLAGS([-Werror])])
> -+
> -+AX_APPEND_COMPILE_FLAGS([-Wall -Wcast-qual -Wno-error=deprecated-declarations])
> - AX_APPEND_COMPILE_FLAGS([-Wextra -Wwrite-string -Wno-unused-parameter])
> - AX_APPEND_COMPILE_FLAGS([-D_GNU_SOURCE])
> -
> diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.14.bb
> similarity index 67%
> rename from meta/recipes-devtools/json-c/json-c_0.13.1.bb
> rename to meta/recipes-devtools/json-c/json-c_0.14.bb
> index 522879f21f..99fde873b1 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.14.bb
> @@ -4,19 +4,14 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
>
> -SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
> -           file://add-disable-werror-option-to-configure.patch \
> -           "
> -SRC_URI[md5sum] = "04969ad59cc37bddd83741a08b98f350"
> -SRC_URI[sha256sum] = "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
> +SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
> +SRC_URI[sha256sum] = "b377de08c9b23ca3b37d9a9828107dff1de5ce208ff4ebb35005a794f30c6870"
>
>  UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
>  UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
>
>  RPROVIDES_${PN} = "libjson"
>
> -inherit autotools
> -
> -EXTRA_OECONF = "--disable-werror"
> +inherit cmake
>
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.26.2
>
> 
