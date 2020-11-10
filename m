Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.25498.1605000423022959512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 01:27:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=hRFyjSSY;
 spf=pass (domain: burtonini.com, ip: 209.85.208.175, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f175.google.com with SMTP id y25so12961966lja.9
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 01:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YE6/F9UOLMWUQS9yyZZPjCgmcAeZMg0lt+EL3FdPmOU=;
        b=hRFyjSSYxl84hKL74bJoRyCMdXOWLecDxqOADNizIu/0CFzxIJOFiGm0+p+IeIsG6o
         hOcZaHCWWEYJ9l3Ss5Acyx7zYEg9PeDOUuKxKgG3vJIeUQhuamT+2ZTAy7Yx77Sk4DoC
         xeK62ad76YRj/+RqX45PGFtr7drtxGE77X9QXx9vC4EpzT0H4CUSfO1Ql76WCzmVsvW8
         2l3ZQoO20A3Prz/xFnyDH4Af7kbYu+I/EHPRj8nNkP2M1Hqo5CRxOLOCBrGgfdT+QZSr
         NJ99r/o+HajvaO1qSbm7xWxpVCu1+7P8ZghfJy9MlmqODFOBH03Dr7mPbkoOB15IVYWo
         O6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YE6/F9UOLMWUQS9yyZZPjCgmcAeZMg0lt+EL3FdPmOU=;
        b=A3c0oAvX4UXdSJxYNvoYQE7/MyZ5eQIOjd8ehMSGYVaD9PlusW3s2hV34LigOthb1U
         cNPfSPeQtBmmaPR3nZofmxcz2+3XteKiKxCQUVeFTSOI8hVGgE7aip6xkJQ2DXkmzXiW
         MmzVbvFOI+i7RUpAO0OefiaSkTsY5djCbnDhtMyFK0YSWvG02yDfSz5HiYZS7LRmCgMb
         r2dcGwOUxUXiZX48+K7hKLHDPaGNfAvi8lizTpngZQ6svPTvK7SSiY/LzOSdXL9T+KDp
         TReBUcO4cQX8EOxDP/Wu2hES4tannyfjEVSaLttbHU6Vg3K9DMmeU6drOwnfvJoMTNPA
         YJAw==
X-Gm-Message-State: AOAM531wDlKb9dBSER0fJFic1pGJDDAp8XjeChtiVH7mjzHGFsLm7QWt
	wgzuXbLpTx3naXO2cYXmYWPB8gN81P3wZBvyAuT21Q==
X-Google-Smtp-Source: ABdhPJz0LrAC0l2Dh+M2s5tP5zs/fSCq8qTxOpTLZ0ljoqE56E+TftFJehgaq87yWoM9BIWGHgsuZHxseex/h0HiFKI=
X-Received: by 2002:a2e:3604:: with SMTP id d4mr3628947lja.340.1605000420941;
 Tue, 10 Nov 2020 01:27:00 -0800 (PST)
MIME-Version: 1.0
References: <20201110005956.2972007-1-raj.khem@gmail.com>
In-Reply-To: <20201110005956.2972007-1-raj.khem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 10 Nov 2020 09:26:49 +0000
Message-ID: <CAAnfSTtprq2pOLkiOH4q4JDJc-oYgWDNi0m3h9ur9ExmZqMfBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libical: Fix build with icu-68
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Can you resend this using the upstream fix:

https://github.com/libical/libical/commit/a3308a23912bba2db654a8c456165c31888cc897

Thanks,
Ross

On Tue, 10 Nov 2020 at 01:00, Khem Raj <raj.khem@gmail.com> wrote:
>
> icu-68.1 removed TRUE and FALSE public macro definitions
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-Fix-build-with-icu-68.1.patch        | 46 +++++++++++++++++++
>  meta/recipes-support/libical/libical_3.0.8.bb |  1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
>
> diff --git a/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch b/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
> new file mode 100644
> index 0000000000..8f3a6e1563
> --- /dev/null
> +++ b/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
> @@ -0,0 +1,46 @@
> +From 6fa716bb11d16a7b073f35a36651c6ef23a7fdac Mon Sep 17 00:00:00 2001
> +From: Lars Wendler <polynomial-c@gentoo.org>
> +Date: Fri, 30 Oct 2020 11:24:34 +0100
> +Subject: [PATCH] Fix build with icu-68.1
> +
> +icu-68.1 removed public macro definitions for TRUE and FALSE
> +
> +Upstream-Status: Pending
> +Signed-off-by: Lars Wendler <polynomial-c@gentoo.org>
> +---
> + src/libical/icalrecur.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/libical/icalrecur.c b/src/libical/icalrecur.c
> +index 7317845..bd1046f 100644
> +--- a/src/libical/icalrecur.c
> ++++ b/src/libical/icalrecur.c
> +@@ -143,6 +143,7 @@
> + #include <stdlib.h>
> +
> + #if defined(HAVE_LIBICU)
> ++#include <stdbool.h>
> + #include <unicode/ucal.h>
> + #include <unicode/ustring.h>
> + #define RSCALE_IS_SUPPORTED 1
> +@@ -1018,7 +1019,7 @@ icalarray *icalrecurrencetype_rscale_supported_calendars(void)
> +
> +     calendars = icalarray_new(sizeof(const char **), 20);
> +
> +-    en = ucal_getKeywordValuesForLocale("calendar", NULL, FALSE, &status);
> ++    en = ucal_getKeywordValuesForLocale("calendar", NULL, false, &status);
> +     while ((cal = uenum_next(en, NULL, &status))) {
> +         cal = icalmemory_tmp_copy(cal);
> +         icalarray_append(calendars, &cal);
> +@@ -1411,7 +1412,7 @@ static int initialize_rscale(icalrecur_iterator *impl)
> +         }
> +
> +         /* Check if specified calendar is supported */
> +-        en = ucal_getKeywordValuesForLocale("calendar", NULL, FALSE, &status);
> ++        en = ucal_getKeywordValuesForLocale("calendar", NULL, false, &status);
> +         while ((cal = uenum_next(en, NULL, &status))) {
> +             if (!strcmp(cal, rule.rscale)) {
> +                 is_hebrew = !strcmp(rule.rscale, "hebrew");
> +--
> +2.29.2
> +
> diff --git a/meta/recipes-support/libical/libical_3.0.8.bb b/meta/recipes-support/libical/libical_3.0.8.bb
> index efb9433412..6230f09eca 100644
> --- a/meta/recipes-support/libical/libical_3.0.8.bb
> +++ b/meta/recipes-support/libical/libical_3.0.8.bb
> @@ -11,6 +11,7 @@ SECTION = "libs"
>  SRC_URI = " \
>      https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
>      file://0001-Use-our-hand-build-native-src-generator.patch \
> +    file://0001-Fix-build-with-icu-68.1.patch \
>  "
>  SRC_URI[md5sum] = "41bd1f1fcdcb4779cea478bb55cf07bf"
>  SRC_URI[sha256sum] = "09fecacaf75ba5a242159e3a9758a5446b5ce4d0ab684f98a7040864e1d1286f"
> --
> 2.29.2
>
>
> 
>
