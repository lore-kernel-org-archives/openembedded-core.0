Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0BCC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 15:03:26 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web08.8747.1654095800469200106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 08:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yMFOjudz;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.42,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f42.google.com with SMTP id h19so2627183edj.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8q8dC612FHOLWHg5CKwZ4dTYQt01yGRMd8iPfkMjT6o=;
        b=yMFOjudzFfuLCTjb0X4T+I7wz3ZDbpLVhWufqX0FMsipTbeNnFNt1DPbAY8SJIaLBK
         DU7V+KjL7SmNK8bEEvzBMnHEk7R7585SVCnxGEFmmU3eDFLftbX4ClpOrrmUOEgNsM7U
         JvwNW/mGEjsry+dkYJrZ3yveztGHWwlYrbqYU3O9K1A/p6GwQI+sRXE63som0koYUbId
         aOG9sJY5Hjt4z5yI5r10/CXUZACmE7hsjpSjxsss7OGv2lQIsGlHCahiWIjTvgEgomRQ
         muQTvFg87f0rPn9XBGb+SN15Jpz27lQS76jxs4cY9qb+p6rg2rzvJwMJS3xfgvZjTro1
         1IKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8q8dC612FHOLWHg5CKwZ4dTYQt01yGRMd8iPfkMjT6o=;
        b=RzvSvet/qQLHaOwotGbK3+gRB8SiYqwm0KLy+SBYa5C+Fd/GjcB787WmSAX+yr0XaL
         BgIvEL9pY5nZJ5kQ0O/YmeecSDv8v5XckgM4nRhNKJ3Nq+fqmhp4eMlb6e9dIniyyBGt
         FArIbMT+c/oP5Myy5CJBC26SNL76ETfWLblqvoDOMdiFVI16W4A8q90Vah4a3152f5qp
         cGQjBlFvSv+OzLhg/q2f3WVT1z6X3Thk6roe+ScBL+QZA/9JmJX/1+m6C0TBwTR648lv
         WEzveNuMgnlEe+Mkg8CY4abwvtOgkHwIzkdQnnVa19Czu4XGiy6WV28vo4pAJ/JP92eN
         J4iw==
X-Gm-Message-State: AOAM532zW+1I/wGckr/QsnKhVIqVVTZp5AW7kQI//SL6j11FOIOamlgr
	pIsADr6oJ6K6eMAPrI94Y0x0xjnh/HRhNhDlgotuaQ==
X-Google-Smtp-Source: 
 ABdhPJzbR2zyqCreJ1LNyQmKT4VJcNLfxmQJlBz2+1PnYT3L6YD98c0w1PVlALo4mL8t/CBIy5MJfp7SspeqcVySXPc=
X-Received: by 2002:a05:6402:44e:b0:42a:6266:3f15 with SMTP id
 p14-20020a056402044e00b0042a62663f15mr117990edw.418.1654095798703; Wed, 01
 Jun 2022 08:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220601105312.29861-1-omkarpatil10.93@gmail.com>
In-Reply-To: <20220601105312.29861-1-omkarpatil10.93@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 1 Jun 2022 05:03:07 -1000
Message-ID: 
 <CAOSpxdav+PkLTi-xPpdeJbMM--GoJXiF5Z=Fv0gaBGYSnkSMMw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH 1/2] libxslt: update to v1.1.35
To: omkar <omkarpatil10.93@gmail.com>
Cc: openembedded-core@lists.openembedded.org, omkar.patil@kpit.com,
	ranjitsinh.rathod@kpit.com, Markus Volk <f_l_k@t-online.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 15:03:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166381

On Wed, Jun 1, 2022 at 12:53 AM omkar <omkarpatil10.93@gmail.com> wrote:
>
> From: Markus Volk <f_l_k@t-online.de>
>
> Security
>
> [CVE-2021-30560] Fix use-after-free in xsltApplyTemplates
> Fix memory leak in xsltDocumentElem (David King)
> Fix memory leak in xsltCompileIdKeyPattern (David King)
> Fix double-free with stylesheets containing entity nodes
>
> Fixed regressions
>
> Fix performance regression with predicates in patterns
> Fix regression in xsltComputeSortResult
>
> Bug fixes
>
> Fix conflict resolution for templates with same priority
> Fix xsl:number generating invalid UTF-8
> Support attribute value templates in xsl:sort lang attributes
> Don't pass first xsl:sort in xsl:apply-templates twice
> Fix quadratic runtime with text and xsl:message
>
> Don't allow empty EXSLT durations
>
> Improvements
> Add xsltproc --huge Argument via libxml XML_PARSE_HUGE (William N. Braswell, Jr.)
>
> Tests, code quality, fuzzing
>
> Remove .travis.yml
> Fix some misleading indentation (David King)
> Use actual types for templates in struct _xsltStylesheet
> Add CI for CMake on MSVC (Markus Rickert)
> Check for null pointer before calling freelocale
> Add CI test for Python 3
> Don't set maxDepth in XPath contexts
> Transfer XPath limits to XPtr context
> Stop using maxParserDepth XPath limit
> Make long-to-double cast explicit in date.c
> Disable LeakSanitizer
> Run clang CI tests with -Wimplicit-int-conversion
> Fix implicit-int-conversion warning in exslt/crypto.c
> Fix clang -Wimplicit-int-conversion warning (David Kilzer)
> Fix clang -Wconditional-uninitialized warning in libxslt/numbers.c (David Kilzer)
> Fix -Wshadow warnings in libexslt/dynamic.c (David Kilzer)
> Also search parent dir for source XML when fuzzing
>
> Build system, portability
>
> Add CMake build files (Markus Rickert)
> Initial support for Python 3 (Suleyman Poyraz)
> Call ANSI versions of WinAPI functions explicitly
> Remove redundant flags from pkg-config files
> Suppress automake warning in tests/XSLTMark
> Fix linking libexslt dynamic library when using MinGW (Vadim Zeitlin)
> Added platform specific path separators (Dmitriy Korovkin)
> win32: allow passing *FLAGS on command line
> Fix export of xsltExtMarker on Windows (David Kilzer)
> Fix redundant includes already in libexslt.h (David Kilzer)
> Minor fixes to configure.js
> Fix variable syntax in Python configuration
> Add new EXSLT string tests to EXTRA_DIST
> Fix xml2-config check in configure script
> win32: Add configuration for profiler (Chun-wei Fan)
> Check whether 'xml2-config --dynamic' is supported
>
> Documentation
>
> Add Makefile rule to regenerate xsltproc.html
> Update links
> Remove MAINTAINERS
> Upload documentation to GitLab Pages
> Add documentation in devhelp format
> Add --enable-rebuild-docs configure option
> Fix libexslt header summaries
> Fix validity of tutorial XML (David King)
> Use DocBook URL for tutorial DTD (David King)
> Update libxslt.doap
> Add missing options to xsltproc man page

This seems to be much more than a bug fix/security release, so I'm not
sure it is suitable for an LTS branch.

If the intent was to fix CVE-2021-30560, I'd prefer to see a patch
adding the relevant commits for just that fix.

Thanks for helping out with CVEs, I appreciate it!

Steve

> (From OE-Core rev: 6b5b1486bbd381b2b657645e91a1712332ddcb94)
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit daa312851681c55d81391b37a30a518f3e74e540)
>
> Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
> ---
>  .../libxslt/{libxslt_1.1.34.bb => libxslt_1.1.35.bb}        | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>  rename meta/recipes-support/libxslt/{libxslt_1.1.34.bb => libxslt_1.1.35.bb} (89%)
>
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.34.bb b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
> similarity index 89%
> rename from meta/recipes-support/libxslt/libxslt_1.1.34.bb
> rename to meta/recipes-support/libxslt/libxslt_1.1.35.bb
> index 63cce6fe06..0f25043743 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.34.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
> @@ -13,11 +13,9 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
>  SECTION = "libs"
>  DEPENDS = "libxml2"
>
> -SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
> -          "
> +SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
>
> -SRC_URI[md5sum] = "db8765c8d076f1b6caafd9f2542a304a"
> -SRC_URI[sha256sum] = "98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ffd55bf926a7f93f7f"
> +SRC_URI[sha256sum] = "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eebc10c93ce1f34dd79"
>
>  UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
>
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166372): https://lists.openembedded.org/g/openembedded-core/message/166372
> Mute This Topic: https://lists.openembedded.org/mt/91472461/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

