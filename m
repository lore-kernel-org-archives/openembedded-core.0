Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC96C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 04:18:31 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.5716.1714623504709608722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 21:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BheRyrX2;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-41c7ac73fddso33696245e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 21:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714623503; x=1715228303; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Env3sZ9lMmfqf1pizo30hWcJ98jCzG/nywn6tMsipV8=;
        b=BheRyrX2Yf5P3EvG7imcVBJrXWgki/QflG1+d73hOs9I2fvTJVK84JUkaxrn/x05Zu
         alP2BR1KrETeYQ5WI0szni8fb0VuwS8MHrv5zbVqjMEhF5Zelb9l707beXjWnwXxfNaV
         hi7kKXri0nDqCkfZBf6Y4h9rmejs4DTIA95YgrHOjGUnIPlwZh/mRheO6P5B0eYFg+p1
         YP2LWMQpoMb+sUZ3TMEEEpT8JdgxbMNJkhuK/Wyy+0FurguJ2GOhhWqRtlJahTujmZ/U
         2uojNYz+TO+p7l8pS5hG3Nk1JaI1yiwyM/3TSy/dWplu1nUDOXtpa2H4nB24/w0Z5oB6
         TiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714623503; x=1715228303;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Env3sZ9lMmfqf1pizo30hWcJ98jCzG/nywn6tMsipV8=;
        b=gVCef5pbS3dLMyvgIW3K4MDOJChVPuQzQQws1tijSstjvl0tait2BosQV4V89BFYhh
         77QJM9zTnI2RKANZbLRdIcZbs98AZXYWIfVVWrTiMviTrD8bMpxmvR6UV6GI4bEhhZZS
         zdTdwEPqfu+h1fQmZq4ziogw3EUyKs+vRusCm3fis9wdzr7umR2wyodQI4Un+mPxCsDO
         sCRf+ADRJ+djAHqv81MUQzpbpq0nO+vLZMjDq2Bf+qH/WQapaanZwkMzjzdxeXgj/ErN
         CLv/XskoHRlxpFrK/PHJ8zGpLM5G9+/9HrhcL2svok831Z/dB3ELGmo4PyzKLPjxNMdN
         sHOw==
X-Gm-Message-State: AOJu0YyMUvfcGxEEx+zGIggcdCMY7/Ok1eKFcUtdZp9rPdGnfhN8ZG2y
	Kcrx8yXUlgzhB7Xw8wGYhPpK9rK7lQP6iYdRn/enVGtA/F5b1ydjZ8sZFbmv
X-Google-Smtp-Source: AGHT+IGM9b5deiZQMZAwvCO491JsVicBfJTQ22D3RIJiikJMgeBWTUrYBYFoptdUIgmEXfH0ftyekA==
X-Received: by 2002:a05:600c:4fcd:b0:41b:bb90:4af with SMTP id o13-20020a05600c4fcd00b0041bbb9004afmr4058282wmq.20.1714623502482;
        Wed, 01 May 2024 21:18:22 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b0041bbec72670sm408721wmb.39.2024.05.01.21.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 21:18:21 -0700 (PDT)
Message-ID: <e4128c16-06e6-4a82-b839-4ee40c12e87e@gmail.com>
Date: Thu, 2 May 2024 06:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] zip: Don't define NO_DIR
To: openembedded-core@lists.openembedded.org
References: <17CB48EC5C0E71A3.13927@lists.openembedded.org>
Content-Language: en-US
Cc: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <17CB48EC5C0E71A3.13927@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 04:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198898

This one was actually "v2" that patchtest does not fail.
Please apply.

2024. 05. 01. 8:17 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> The build framework of zip adds -DNO_DIR to CFLAGS after
> failing to link this piece of test code:
>
>    int main() { return closedir(opendir(".")); }
>
> However, zip does not take a case into account when it does not
> need to link to an extra library for these functions.
>
> When -DNO_DIR is used, the code in unix.c defines custom
> opendir()/readdir()/closedir() functions in a way that GCC 14
> chokes on.
>
> GLIBC has both <dirent.h> and <sys/dir.h> and apps don't need
> any extra library to link with.
>
> Add a patch to remove the definition of NO_DIR.
> Instead, use -DHAVE_DIRENT_H in the recipe.
>
> Remove 0002-unix.c-Do-not-redefine-DIR-as-FILE.patch which
> is now unnecessary.
>
> This fixes the compiler error observed with GCC 14.
>
> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> ---
>   ...2-unix.c-Do-not-redefine-DIR-as-FILE.patch | 35 -------------------
>   .../zip/zip-3.0/dont-define-NO_DIR.patch      | 14 ++++++++
>   meta/recipes-extended/zip/zip_3.0.bb          |  6 ++--
>   3 files changed, 17 insertions(+), 38 deletions(-)
>   delete mode 100644 meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch
>   create mode 100644 meta/recipes-extended/zip/zip-3.0/dont-define-NO_DIR.patch
>
> diff --git a/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch b/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch
> deleted file mode 100644
> index a86e03e620..0000000000
> --- a/meta/recipes-extended/zip/zip-3.0/0002-unix.c-Do-not-redefine-DIR-as-FILE.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 76f5bf3546d826dcbc03acbefcf0b10b972bf136 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 10 Aug 2022 17:19:38 -0700
> -Subject: [PATCH 2/2] unix.c: Do not redefine DIR as FILE
> -
> -DIR is already provided on Linux via
> -/usr/include/dirent.h system header
> -
> -Upstream-Status: Inactive-Upstream
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - unix/unix.c | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/unix/unix.c b/unix/unix.c
> -index ba87614..6e6f4d2 100644
> ---- a/unix/unix.c
> -+++ b/unix/unix.c
> -@@ -61,13 +61,11 @@ local time_t label_utim = 0;
> - /* Local functions */
> - local char *readd OF((DIR *));
> -
> --
> - #ifdef NO_DIR                    /* for AT&T 3B1 */
> - #include <sys/dir.h>
> - #ifndef dirent
> - #  define dirent direct
> - #endif
> --typedef FILE DIR;
> - /*
> - **  Apparently originally by Rich Salz.
> - **  Cleaned up and modified by James W. Birdsall.
> ---
> -2.37.1
> -
> diff --git a/meta/recipes-extended/zip/zip-3.0/dont-define-NO_DIR.patch b/meta/recipes-extended/zip/zip-3.0/dont-define-NO_DIR.patch
> new file mode 100644
> index 0000000000..8528dbb55e
> --- /dev/null
> +++ b/meta/recipes-extended/zip/zip-3.0/dont-define-NO_DIR.patch
> @@ -0,0 +1,14 @@
> +Upstream-Status: Inactive-Upstream [no upstream]
> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> +
> +--- zip30/unix/configure~	2024-05-01 07:22:18.000000000 +0200
> ++++ zip30/unix/configure	2024-05-01 07:23:04.725337836 +0200
> +@@ -604,8 +604,6 @@
> +   done
> +   if [ ${OPT} ]; then
> +     LFLAGS2="${LFLAGS2} ${OPT}"
> +-  else
> +-    CFLAGS="${CFLAGS} -DNO_DIR"
> +   fi
> + fi
> +
> diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
> index 70df5ab872..a548087545 100644
> --- a/meta/recipes-extended/zip/zip_3.0.bb
> +++ b/meta/recipes-extended/zip/zip_3.0.bb
> @@ -17,8 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.
>              file://0002-configure-support-PIC-code-build.patch \
>              file://0001-configure-Use-CFLAGS-and-LDFLAGS-when-doing-link-tes.patch \
>              file://0001-configure-Specify-correct-function-signatures-and-de.patch \
> -           file://0002-unix.c-Do-not-redefine-DIR-as-FILE.patch \
>              file://0001-unix-configure-use-_Static_assert-to-do-correct-dete.patch \
> +           file://dont-define-NO_DIR.patch \
>              "
>   UPSTREAM_VERSION_UNKNOWN = "1"
>   
> @@ -32,8 +32,8 @@ CVE_STATUS[CVE-2018-13684] = "cpe-incorrect: Not for zip but for smart contract
>   # CFLAGS_NOOPT.  It will also force -O3 optimization, overriding
>   # whatever we set.
>   EXTRA_OEMAKE = "'CC=${CC}' 'BIND=${CC}' 'AS=${CC} -c' 'CPP=${CPP}' \
> -		'CFLAGS=-I. -DUNIX ${CFLAGS}' \
> -		'CFLAGS_NOOPT=-I. -DUNIX ${CFLAGS}' \
> +		'CFLAGS=-I. -DUNIX -DHAVE_DIRENT_H ${CFLAGS}' \
> +		'CFLAGS_NOOPT=-I. -DUNIX -DHAVE_DIRENT_H ${CFLAGS}' \
>   		'INSTALL=install' 'INSTALL_D=install -d' \
>   		'BINFLAGS=0755'"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198786): https://lists.openembedded.org/g/openembedded-core/message/198786
> Mute This Topic: https://lists.openembedded.org/mt/105836341/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


