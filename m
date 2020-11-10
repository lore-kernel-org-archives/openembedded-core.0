Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.31374.1605030390183869531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 09:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AMF/wts6;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id e21so10828343pgr.11
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 09:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=6LTlGSXH7rmDNkTtsL/GNQ5Oo0T0L9A7VXkPvrGcFRA=;
        b=AMF/wts62mrRFG76XIIa04+DsgEfg8sZS8zFAIyqSD8FUtQVG+kOBDZMVn9YZmQ7/5
         ph3A89VqLM2dUpJIKmQI8/WwarTSz9NSDZjX8TnM2N19K7wRFRXV42orrJmZPzUyBu3y
         0srtT7VNY+dhNOfmDVlx8V0BsmCdVbcLXVFBe0gh1WRiLURnKN8SxL5pk+kvQ9MmoE+y
         iygPezp3q9yCq7A76bOKoFi7ROvV7sfCMGU+9oH1ZWw/Fh9Sqh7TySK3y/3aGYvYGaqx
         aNpeEf33ITNmZd7Na0aplWdqhqobkXpheA3xUkh3s50mO+w5iO7ufYmByycW3m+qExJk
         /SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6LTlGSXH7rmDNkTtsL/GNQ5Oo0T0L9A7VXkPvrGcFRA=;
        b=ER2BTbosAkgFMG2tsj2ihSuHfqI1uBGqJWwACQpe0G7vGgFRqB+czUA9hvE4vpwh4g
         VuA3DEaFjOX0hPZ7uev8DpyhYhgGCLJ50zmZ3BtsAsNz8UbwTYoAmh9cqtFyo2P+F2nA
         H7SLFv4w11SOPEQaHEkFucQEZur2EULAiYwoWy7GtkCIudPYZLNOuRQ2cC/sn8lwhn7Q
         FbTfBtxbsNI2VxHzQN5e4KAHgZii3XrtCXnybsuPwEISn64WrvQU0rAXt2rKgYPGLIz5
         zmeNc8DTLVErCUtI/oDyyYZ+pmBZwj4jNw0x33hr7pTS2+jAzlV8FQTZ6938QBT9kF0a
         XUHw==
X-Gm-Message-State: AOAM5308QYjFuFiG80S9Pn44o/rfY7xMuITEr1zRVSAYDIX11WSBEnFg
	CwrR1D7zJJzHAVnsYbF7WB8LAAeJP4zdTw==
X-Google-Smtp-Source: ABdhPJzbyRSJ6dnnGQ17+N5SznBIIeZra8COwf00DCm8/g9H3J8aujP5d0nZG5CKe498+pbuVRPi1w==
X-Received: by 2002:a17:90a:c401:: with SMTP id i1mr234836pjt.184.1605030389239;
        Tue, 10 Nov 2020 09:46:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::740e? ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id e8sm13979334pfn.175.2020.11.10.09.46.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 09:46:28 -0800 (PST)
Subject: Re: [OE-core] [PATCH] libical: backport a patch to fix build with ICU 68.1
To: openembedded-core@lists.openembedded.org
References: <20201110104753.250322-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <e29a42c1-68e7-ce55-6323-01676a95e0de@gmail.com>
Date: Tue, 10 Nov 2020 09:46:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201110104753.250322-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

thanks this is better.

On 11/10/20 2:47 AM, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   .../0001-Fix-build-with-icu-68.1.patch        | 81 +++++++++++++++++++
>   meta/recipes-support/libical/libical_3.0.8.bb |  1 +
>   2 files changed, 82 insertions(+)
>   create mode 100644 meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
> 
> diff --git a/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch b/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
> new file mode 100644
> index 00000000000..79e1475c6c5
> --- /dev/null
> +++ b/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
> @@ -0,0 +1,81 @@
> +Upstream-Status: Backport
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From 52d603212173d4502800bf746436a93f806a8898 Mon Sep 17 00:00:00 2001
> +From: Allen Winter <allen.winter@kdab.com>
> +Date: Sat, 31 Oct 2020 17:38:01 -0400
> +Subject: [PATCH] Fix build with icu-68.1
> +
> +Use stdbool.h to define true and false when possible
> +
> +Issue#448
> +---
> + ConfigureChecks.cmake   |  1 +
> + config.h.cmake          |  3 +++
> + src/libical/icalrecur.c | 10 ++++++++--
> + 3 files changed, 12 insertions(+), 2 deletions(-)
> +
> +diff --git a/ConfigureChecks.cmake b/ConfigureChecks.cmake
> +index e4d0e2ec..bba33fa9 100644
> +--- a/ConfigureChecks.cmake
> ++++ b/ConfigureChecks.cmake
> +@@ -10,6 +10,7 @@ check_include_files(sys/utsname.h HAVE_SYS_UTSNAME_H)
> + check_include_files(fcntl.h HAVE_FCNTL_H)
> + check_include_files(unistd.h HAVE_UNISTD_H)
> + check_include_files(wctype.h HAVE_WCTYPE_H)
> ++check_include_files(stdbool.h HAVE_STDBOOL_H)
> +
> + include(CheckFunctionExists)
> + if(WIN32 AND MSVC)
> +diff --git a/config.h.cmake b/config.h.cmake
> +index 8fd3421b..c8008692 100644
> +--- a/config.h.cmake
> ++++ b/config.h.cmake
> +@@ -39,6 +39,9 @@
> + /* Define to 1 if you have the <dirent.h> header file. */
> + #cmakedefine HAVE_DIRENT_H 1
> +
> ++/* Define to 1 if you have the <stdbool.h> header file. */
> ++#cmakedefine HAVE_STDBOOL_H 1
> ++
> + /* Define if we have pthread. */
> + #cmakedefine HAVE_PTHREAD_ATTR_GET_NP 1
> + #cmakedefine HAVE_PTHREAD_GETATTR_NP 1
> +diff --git a/src/libical/icalrecur.c b/src/libical/icalrecur.c
> +index 73178450..b3f054b8 100644
> +--- a/src/libical/icalrecur.c
> ++++ b/src/libical/icalrecur.c
> +@@ -145,6 +145,12 @@
> + #if defined(HAVE_LIBICU)
> + #include <unicode/ucal.h>
> + #include <unicode/ustring.h>
> ++#if defined(HAVE_STDBOOL_H)
> ++#include <stdbool.h>
> ++#else
> ++#define false 0
> ++#define true 1
> ++#endif
> + #define RSCALE_IS_SUPPORTED 1
> + #else
> + #define RSCALE_IS_SUPPORTED 0
> +@@ -1018,7 +1024,7 @@ icalarray *icalrecurrencetype_rscale_supported_calendars(void)
> +
> +     calendars = icalarray_new(sizeof(const char **), 20);
> +
> +-    en = ucal_getKeywordValuesForLocale("calendar", NULL, FALSE, &status);
> ++    en = ucal_getKeywordValuesForLocale("calendar", NULL, false, &status);
> +     while ((cal = uenum_next(en, NULL, &status))) {
> +         cal = icalmemory_tmp_copy(cal);
> +         icalarray_append(calendars, &cal);
> +@@ -1411,7 +1417,7 @@ static int initialize_rscale(icalrecur_iterator *impl)
> +         }
> +
> +         /* Check if specified calendar is supported */
> +-        en = ucal_getKeywordValuesForLocale("calendar", NULL, FALSE, &status);
> ++        en = ucal_getKeywordValuesForLocale("calendar", NULL, false, &status);
> +         while ((cal = uenum_next(en, NULL, &status))) {
> +             if (!strcmp(cal, rule.rscale)) {
> +                 is_hebrew = !strcmp(rule.rscale, "hebrew");
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-support/libical/libical_3.0.8.bb b/meta/recipes-support/libical/libical_3.0.8.bb
> index efb9433412f..6230f09eca1 100644
> --- a/meta/recipes-support/libical/libical_3.0.8.bb
> +++ b/meta/recipes-support/libical/libical_3.0.8.bb
> @@ -11,6 +11,7 @@ SECTION = "libs"
>   SRC_URI = " \
>       https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
>       file://0001-Use-our-hand-build-native-src-generator.patch \
> +    file://0001-Fix-build-with-icu-68.1.patch \
>   "
>   SRC_URI[md5sum] = "41bd1f1fcdcb4779cea478bb55cf07bf"
>   SRC_URI[sha256sum] = "09fecacaf75ba5a242159e3a9758a5446b5ce4d0ab684f98a7040864e1d1286f"
> 
> 
> 
> 
> 
