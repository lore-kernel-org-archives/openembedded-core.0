Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.1952.1614539414141115379
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 11:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bvhJmVlx;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id u12so9965535pjr.2
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 11:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ASmVJ9DUvdVdssuVSPRo40U0xqELzgv0LzTvb3H7wJ4=;
        b=bvhJmVlxlxTrrATv4OVYb245EHH/VhK6cCjtGgsIGUrLTRnQps5Y7Sb8VvEbVYqj8D
         wwdC3ynTzvnsrsEWONNbKKEKEnIrDTQxyXRkYPh8+Yfp690Der5q8epOAuiY2saS1n0z
         fGiu2ShBB4nZUZBy8LXKVNshtgYdrKd3TqIQDMQVJj1vzaICaWhx9r+hIEwAPS8ef9oC
         4sZDIEJPJld26nosAlIP5lEUEC6+VHbu0pAGAXGvVyBOmz27k4NavbjzjOQ/kwS3wIu6
         vIIyRUYS26lWWqYd7dbf/hed6RAPgkBIihfN69hl+WUA1h+8BvrWWg/TKsxlcFMu+x80
         Gfuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ASmVJ9DUvdVdssuVSPRo40U0xqELzgv0LzTvb3H7wJ4=;
        b=aoAmLToCdUXnvCWUWl8J8FCxHrSzYanxwORarM84ztm0tF4fzUr4g9ita6RPJBrJB4
         1EeWi2gPF33IYbmVz1oSes6IaLXvJJVltZ/8AgIFFoJLgoNAMLEjJqZK12AXqC9A5rKj
         qsTzUyp4LTOnB5dFohHn1n6HqgjQnP3dKBHZpxmpXJ7GQamRdvpX62J/oj2gU1dhJ/8t
         hKraLtaFg2hwL/EqUJ9QVWLD0OgvwMy+jKoBvp7A+PprRGRd5/jkAroMhbQOYaVfKTv+
         y61cesHX5ENs3ZduEr1AbzIoadLxtSa2rj8FZMBSkDhixHJ+4QHnnx/fczl2fw78JTUN
         +jBw==
X-Gm-Message-State: AOAM532ozXlrojjbBrfm8tNTW2y3P1q8uFwXfGGMcaoyhMqBntSgrSSV
	Zmxo4DWThNwb5nWNsFVHFsjb/5XKZTQsaQ==
X-Google-Smtp-Source: ABdhPJyL1XDzocDyzgYBPUGjL1UVNjAYTF1iklNhBlu+sYSeOkbOf6hFvm5WmFpkDSFJ/9U4dAl25g==
X-Received: by 2002:a17:90a:868c:: with SMTP id p12mr4481991pjn.82.1614539413375;
        Sun, 28 Feb 2021 11:10:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::5d43? ([2601:646:9200:a0f0::5d43])
        by smtp.gmail.com with ESMTPSA id s13sm14960263pjm.1.2021.02.28.11.10.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Feb 2021 11:10:13 -0800 (PST)
Subject: Re: [OE-core] [PATCH 18/24] procps: update 3.3.16 -> 3.3.17
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
 <20210228153702.498275-18-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <c6f58a09-04d1-16d3-e162-88e24a6c6814@gmail.com>
Date: Sun, 28 Feb 2021 11:10:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210228153702.498275-18-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/28/21 7:36 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   .../procps/0001-w.c-correct-musl-builds.patch | 44 +++++++++++++++++++
>   ...02-proc-escape.c-add-missing-include.patch | 23 ++++++++++
>   .../{procps_3.3.16.bb => procps_3.3.17.bb}    |  4 +-
>   3 files changed, 70 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
>   create mode 100644 meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch
>   rename meta/recipes-extended/procps/{procps_3.3.16.bb => procps_3.3.17.bb} (94%)
> 
> diff --git a/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch b/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
> new file mode 100644
> index 0000000000..c92ad28e4f
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps/0001-w.c-correct-musl-builds.patch
> @@ -0,0 +1,44 @@
> +From 22f8d25567b8d64bdbab0fb0b4915b4362561d9b Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Wed, 24 Feb 2021 21:14:31 +0000
> +Subject: [PATCH] w.c: correct musl builds
> +
> +No need to redefine UT_ stuff to something that does not exist.
> +
> +UT_ is already provided in musl but via utmp.h header, so include
> +it always.
> +
> +Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/126]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + w.c | 9 +--------
> + 1 file changed, 1 insertion(+), 8 deletions(-)
> +
> +diff --git a/w.c b/w.c
> +index 9d07ac9..d10639b 100644
> +--- a/w.c
> ++++ b/w.c
> +@@ -57,9 +57,8 @@
> + #include <unistd.h>
> + #ifdef HAVE_UTMPX_H
> + #	include <utmpx.h>
> +-#else
> +-#	include <utmp.h>
> + #endif
> ++#include <utmp.h>

this would mean when utmpx.h is provided ( e.g. ) it will now include 
both, which is a change perhaps to look more into, it might want them to 
be exclusive.

> + #include <arpa/inet.h>
> +
> + static int ignoreuser = 0;	/* for '-u' */
> +@@ -72,12 +71,6 @@ typedef struct utmpx utmp_t;
> + typedef struct utmp utmp_t;
> + #endif
> +
> +-#if !defined(UT_HOSTSIZE) || defined(__UT_HOSTSIZE)
> +-#	define UT_HOSTSIZE __UT_HOSTSIZE
> +-#	define UT_LINESIZE __UT_LINESIZE
> +-#	define UT_NAMESIZE __UT_NAMESIZE
> +-#endif
> +-
> + #ifdef W_SHOWFROM
> + # define FROM_STRING "on"
> + #else
> diff --git a/meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch b/meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch
> new file mode 100644
> index 0000000000..5fa1ac9d78
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps/0002-proc-escape.c-add-missing-include.patch
> @@ -0,0 +1,23 @@
> +From 4f964821398dff7ab21fec63da15e1e00b2e9277 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Wed, 24 Feb 2021 21:16:14 +0000
> +Subject: [PATCH] proc/escape.c: add missing include
> +
> +Upstream-Status: Submitted [https://gitlab.com/procps-ng/procps/-/merge_requests/126]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + proc/escape.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/proc/escape.c b/proc/escape.c
> +index 2e8fb7d..e1f4612 100644
> +--- a/proc/escape.c
> ++++ b/proc/escape.c
> +@@ -21,6 +21,7 @@
> + #include <sys/types.h>
> + #include <string.h>
> + #include <limits.h>
> ++#include <langinfo.h>
> + #include "procps.h"
> + #include "escape.h"
> + #include "readproc.h"
> diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
> similarity index 94%
> rename from meta/recipes-extended/procps/procps_3.3.16.bb
> rename to meta/recipes-extended/procps/procps_3.3.17.bb
> index ef3ac86e97..c74a901d9a 100644
> --- a/meta/recipes-extended/procps/procps_3.3.16.bb
> +++ b/meta/recipes-extended/procps/procps_3.3.17.bb
> @@ -14,8 +14,10 @@ inherit autotools gettext pkgconfig update-alternatives
>   
>   SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https \
>              file://sysctl.conf \
> +           file://0001-w.c-correct-musl-builds.patch \
> +           file://0002-proc-escape.c-add-missing-include.patch \
>              "
> -SRCREV = "59c88e18f29000ceaf7e5f98181b07be443cf12f"
> +SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
>   
>   S = "${WORKDIR}/git"
>   
> 
> 
> 
> 
> 
