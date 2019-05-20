Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id E9DE77DE86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 20:19:39 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id w22so7304451pgi.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 13:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=s/9AjyHRmgHfIsVktPkKQU6aTDDAtjFD0PoG05Nz0+U=;
	b=rsXHoF8MveOtwnZ/p79GUCK/L1/toHGxJX7EO8TOUeFFVC0RTB3gg0akyFpACtUOx5
	DN0LjeO6sJxWWVznE2Wwk0m2/TQZGilqC26JJ00wqHaEGfEUU/cB0UsQ1p9GcPFkZ0+V
	0H+b9qzCQWHp0QO+UfG0/cWyPooJyg4KUICefz64RA7ShSP6PWcgop4lpnUC7AqzBAAC
	GFiwHhDuNzrYFtLxp1rV1wdIffJcYkFW7hJGrsgw6am6k95LY7cwO5xqhWzJVc0G33Um
	/gNJqYqwe9ujPLz8EYBPt1xsPM3G36ybku68ZXtj5624qkgeynbr/vIoWMMsyxFp61DV
	4ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=s/9AjyHRmgHfIsVktPkKQU6aTDDAtjFD0PoG05Nz0+U=;
	b=SxpUvzFBYxXCRCKCqszDM4k0JXGBpHB2NtB4B71qSJ4+bmk1Nkno+0//WrnFzpTOid
	N6CJUiuC/FE5UpuHjKR7pp+t+DuCK6/TNxH89OvNPrqf8KwzI2Yc77Jj4XaZ5kUeKPqB
	ycijBoD40+TEMO9b4KIxjK1DEGQKWu0G1PB5yzfXlgtaWvNLBLGd80a87L/KyIqG6qu8
	U3zAdIubArTIe0h8AMYuK5HJ5n4AXJziLl0kt6Ws4QoccqDVs2CqwUse6S8HvCedh3+9
	ahJUrqkknRTRD/RELg09Brd1nqJvo8fXmrvRJ4cQO2xkELR/cycxGPCPfoQnKVMA1Foz
	kjIA==
X-Gm-Message-State: APjAAAWKB7rtj384TS0zE4FyGzrnMTG9hPkeJ+BwC6w+owZ040w7xTDn
	3mvWCXRjrwgO+WnP4j3+hurDHQNPQVQ=
X-Google-Smtp-Source: APXvYqwP/obNLAABcip6Au+FT5A7jqYpmTE9KrW7EfqhyzmnAzpZ0TaRrKzalj2EskUyM9pxMF91mA==
X-Received: by 2002:a65:6449:: with SMTP id s9mr75362325pgv.90.1558383580442; 
	Mon, 20 May 2019 13:19:40 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	s2sm17254566pfe.105.2019.05.20.13.19.39
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 13:19:39 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-core@lists.openembedded.org
References: <20190516074834.3014-1-bunk@stusta.de>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8e01a707-fda6-ba0e-5731-4fdc337b09b3@gmail.com>
Date: Mon, 20 May 2019 13:19:38 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190516074834.3014-1-bunk@stusta.de>
Subject: Re: [PATCH] musl: Add TEMP_FAILURE_RETRY from glibc
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
X-List-Received-Date: Mon, 20 May 2019 20:19:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/16/19 12:48 AM, Adrian Bunk wrote:
> Patch it into musl instead of patching all users
> (currently elfutils and next ofono).
> 

this violates musl philosophy, and I would like to stay as close as we 
can, so I would suggest that you propose this patch to upstream musl 
first and get an opinion, if it gets accepted, we can change OE

Richard,

Please revert this patch, I know its now in master, but we should wait 
until upstream agrees to apply this, we are trying to extend C library 
which would fall on us eventually forever if upstream does not accept it.

> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>   ...0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch | 36 +++++++++++++++++++
>   meta/recipes-core/musl/musl_git.bb            |  1 +
>   ...ternatives-for-glibc-assumptions-hel.patch | 30 +---------------
>   3 files changed, 38 insertions(+), 29 deletions(-)
>   create mode 100644 meta/recipes-core/musl/musl/0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch
> 
> diff --git a/meta/recipes-core/musl/musl/0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch b/meta/recipes-core/musl/musl/0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch
> new file mode 100644
> index 0000000000..4d48d61651
> --- /dev/null
> +++ b/meta/recipes-core/musl/musl/0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch
> @@ -0,0 +1,36 @@
> +From 19cbebc3fa33c6a1a71a6036da4d67c98f859f06 Mon Sep 17 00:00:00 2001
> +From: Adrian Bunk <bunk@stusta.de>
> +Date: Wed, 15 May 2019 16:08:33 +0300
> +Subject: unistd.h: Add TEMP_FAILURE_RETRY
> +
> +Signed-off-by: Adrian Bunk <bunk@stusta.de>
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + include/unistd.h | 11 +++++++++++
> + 1 file changed, 11 insertions(+)
> +
> +diff --git a/include/unistd.h b/include/unistd.h
> +index 9485da7a..8a75af57 100644
> +--- a/include/unistd.h
> ++++ b/include/unistd.h
> +@@ -460,6 +460,17 @@ int eaccess(const char *, int);
> + #define _CS_V6_ENV	1148
> + #define _CS_V7_ENV	1149
> +
> ++#ifdef _GNU_SOURCE
> ++#ifndef TEMP_FAILURE_RETRY
> ++# define TEMP_FAILURE_RETRY(expression) \
> ++  (__extension__                                                              \
> ++    ({ long int __result;                                                     \
> ++       do __result = (long int) (expression);                                 \
> ++       while (__result == -1L && errno == EINTR);                             \
> ++       __result; }))
> ++#endif
> ++#endif
> ++
> + #ifdef __cplusplus
> + }
> + #endif
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 1e324804e1..2b433aed8c 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -15,6 +15,7 @@ PV = "${BASEVER}+git${SRCPV}"
>   SRC_URI = "git://git.musl-libc.org/musl \
>              file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
>              file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
> +           file://0001-unistd.h-Add-TEMP_FAILURE_RETRY.patch \
>             "
>   
>   S = "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
> index a4f301d9da..10cdac646c 100644
> --- a/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
> +++ b/meta/recipes-devtools/elfutils/files/0008-build-Provide-alternatives-for-glibc-assumptions-hel.patch
> @@ -64,18 +64,10 @@ index 292082b..308a762 100644
>    #include <stddef.h>
>    #include <stdint.h>
>    #include <sys/param.h>
> -@@ -51,6 +51,16 @@
> +@@ -51,6 +51,8 @@
>    #else
>    # error "Unknown byte order"
>    #endif
> -+#ifndef TEMP_FAILURE_RETRY
> -+#define TEMP_FAILURE_RETRY(expression) \
> -+  (__extension__							      \
> -+    ({ long int __result;						      \
> -+       do __result = (long int) (expression);				      \
> -+       while (__result == -1L && errno == EINTR);			      \
> -+       __result; }))
> -+#endif
>   +
>   +#define error(status, errno, ...) err(status, __VA_ARGS__)
>    
> @@ -141,26 +133,6 @@ index 56e6105..f4a0649 100644
>    #include "../libdw/libdwP.h"	/* DWARF_E_* values are here.  */
>    #include "../libelf/libelfP.h"
>    #include "system.h"
> -diff --git a/libdwfl/libdwfl_crc32_file.c b/libdwfl/libdwfl_crc32_file.c
> -index f849128..6f0aca1 100644
> ---- a/libdwfl/libdwfl_crc32_file.c
> -+++ b/libdwfl/libdwfl_crc32_file.c
> -@@ -29,6 +29,15 @@
> - # include <config.h>
> - #endif
> -
> -+#ifndef TEMP_FAILURE_RETRY
> -+#define TEMP_FAILURE_RETRY(expression) \
> -+  (__extension__                                                             \
> -+    ({ long int __result;                                                    \
> -+       do __result = (long int) (expression);                                \
> -+       while (__result == -1L && errno == EINTR);                            \
> -+       __result; }))
> -+#endif
> -+
> - #define crc32_file attribute_hidden __libdwfl_crc32_file
> - #define crc32 __libdwfl_crc32
> - #include <libdwflP.h>
>   diff --git a/libdwfl/linux-kernel-modules.c b/libdwfl/linux-kernel-modules.c
>   index 360e4ee..b5aa397 100644
>   --- a/libdwfl/linux-kernel-modules.c
> 

