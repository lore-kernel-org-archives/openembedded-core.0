Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2BFD270100
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 19:42:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id k15so4078179wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OHyzgxAgHmChKa1akyAWxlnuHGuFdL8ZdZN1GGVCpGM=;
	b=h1ynXIlVGmEdwIiZ4NC8YrvcDuwNWXLoB64erial59/gbJ6dPCKj9lXs0RIg6rktFL
	u2Epkwbbf7k2BWsUzIaec1zgJ445sTA426VymXcduh8gWCx7HyRXx9QsUKhFBBftoNma
	ikSvuoqxJYw63foG9hHUvEZ0mR9E46arxlO9KB1V5ZsJHbKL01OpPOu0yAJtdzOvOStG
	ucUglCbtDVJAZdnFObEEy/IoirNArvnqatAOP77e+NPkTJQJJvRNgv3UAvaAW9d/YPoC
	SS8qF39MBWKsYpfFq1wuhecb9Y85rh2crwwRjT5fj7vDiMbfm9zLqpeLFCYg1QFbA0mi
	flEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OHyzgxAgHmChKa1akyAWxlnuHGuFdL8ZdZN1GGVCpGM=;
	b=ouRrKb30UmFwVquuCaXZKtTEB/ThdRSB2qLCJPD4WqcZNYbsMZ5m3LU6cOseCRydko
	uAHgS8Gk0GaueXl17Z8i7/JgyEVjvw+RS+ThKg8PdtUtkts6IaRk1uTQ4CVZk26QEa1o
	MnFu73ISWcadMWbDkt/34ZlOz31PWKyYHcWAGUYI60cJpIQI7U8SWiSiM3NK5bE/Fiqw
	tDqZBlmkwC2/CQ71qqaGo9OxsAeVEjFBN46ETFhVY1BIDVokz/MIZeBiUuRHB9UwSKrO
	BwS//Mla1jf5izNDQkXkzd9e6PXo+kTS4NIxFcIHTz5xa+P4ZDCRsAACkG4x9LS2oIfU
	+vwQ==
X-Gm-Message-State: AODbwcD8JyMUu2yXjxk5XCnrTtEM/kim82cyaOBO0l93VCv0EnrsTUXg
	767aq10IkXY7L5hjKNzHXLMnrxzogQ==
X-Received: by 10.80.144.68 with SMTP id z4mr12050192edz.143.1496862808671;
	Wed, 07 Jun 2017 12:13:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Wed, 7 Jun 2017 12:12:58 -0700 (PDT)
In-Reply-To: <20170607184621.5305-1-dev@codyps.com>
References: <20170607184621.5305-1-dev@codyps.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Jun 2017 12:12:58 -0700
Message-ID: <CAMKF1spPa7XHO9s8KW8QdGqQJqY2oJsyVii4+yfd8jRq0fHStA@mail.gmail.com>
To: Cody P Schafer <dev@codyps.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] gcc-6.2: backport fix of check for empty string in ubsan.c
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
X-List-Received-Date: Wed, 07 Jun 2017 19:42:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 7, 2017 at 11:46 AM, Cody P Schafer <dev@codyps.com> wrote:
> From: Joshua Lock <joshua.g.lock@intel.com>
>
> Building gcc-cross-initial with GCC7 on the host fails due to the
> comparison of a pointer to an integer in ubsan_use_new_style_p, which
> is forbidden by ISO C++:
>
> ubsan.c:1474:23: error: ISO C++ forbids comparison between pointer and
> integer [-fpermissive]
>        || xloc.file == '\0' || xloc.file[0] == '\xff'
>
> Backport the fix from upstream GCC to enable the build with GCC 7
>

this is fine


> (From OE-Core rev: 7a7fcbab0365b9501c737dbc02715be14dda72a3)
>
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Cody P Schafer <dev@codyps.com>
> ---
>  meta/recipes-devtools/gcc/gcc-6.2.inc              |  5 ++--
>  .../gcc/gcc-6.2/ubsan-fix-check-empty-string.patch | 28 ++++++++++++++++++++++
>  2 files changed, 31 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2.inc b/meta/recipes-devtools/gcc/gcc-6.2.inc
> index b118995e1d..39ae653805 100644
> --- a/meta/recipes-devtools/gcc/gcc-6.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.2.inc
> @@ -80,8 +80,9 @@ SRC_URI = "\
>             file://0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
>             ${BACKPORTS} \
>  "
> -BACKPORTS = ""
> -
> +BACKPORTS = "\
> +           file://ubsan-fix-check-empty-string.patch \
> +"
>  SRC_URI[md5sum] = "9768625159663b300ae4de2f4745fcc4"
>  SRC_URI[sha256sum] = "9944589fc722d3e66308c0ce5257788ebd7872982a718aa2516123940671b7c5"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch b/meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch
> new file mode 100644
> index 0000000000..c0127198e0
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-6.2/ubsan-fix-check-empty-string.patch
> @@ -0,0 +1,28 @@
> +From 8db2cf6353c13f2a84cbe49b689654897906c499 Mon Sep 17 00:00:00 2001
> +From: kyukhin <kyukhin@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Sat, 3 Sep 2016 10:57:05 +0000
> +Subject: [PATCH] gcc/  * ubsan.c (ubsan_use_new_style_p): Fix check for empty
> + string.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@239971 138bc75d-0d04-0410-961f-82ee72b054a4
> +
> +Upstream-Status: Backport
> +Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> +
> +---
> + gcc/ubsan.c   | 2 +-
> + 2 files changed, 5 insertions(+), 1 deletion(-)
> +
> +Index: gcc-6.3.0/gcc/ubsan.c
> +===================================================================
> +--- gcc-6.3.0.orig/gcc/ubsan.c
> ++++ gcc-6.3.0/gcc/ubsan.c
> +@@ -1471,7 +1471,7 @@ ubsan_use_new_style_p (location_t loc)
> +
> +   expanded_location xloc = expand_location (loc);
> +   if (xloc.file == NULL || strncmp (xloc.file, "\1", 2) == 0
> +-      || xloc.file == '\0' || xloc.file[0] == '\xff'
> ++      || xloc.file[0] == '\0' || xloc.file[0] == '\xff'
> +       || xloc.file[1] == '\xff')
> +     return false;
> +
> --
> 2.13.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

