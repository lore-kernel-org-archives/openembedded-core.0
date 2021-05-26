Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web09.4404.1622016197307972339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 01:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E8D9zz8k;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id 76so136618qkn.13
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 01:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nroQCHVSVdasBG8ZgVw3Mt0lJ/9lKY8TCN04r33f9eI=;
        b=E8D9zz8kGA+7r041eJz0U/D1opGSh6AKWpqY4Udz/kCK0u/mu439kN8wfwHY9axmVW
         D+RHkeM4n+v8DfzLlm5Jjkp4mT8+gOiep5VeSQgeNA7bu7Fw9rsIlImc6utzz0g3zoNb
         41OvgRhYuQ5Kwc52JAAFKDbNVwUqG1BdFzFYzeapJCFhqQBnZW+7DWCgHWb+Xn3bnTBC
         W0nVRuT1TMe7RIOTQcZP/BHgSXVQ0u620DEqHrrwMKl8XcdpZMnw+yF5OnjGcIAf6ABJ
         PDNMTQb3OvqOrkwnwhzzi2f4MZrdwhv1F+h9v0RhnbNkAs/4ybNe9rxb11jRsSW/MjBl
         AFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nroQCHVSVdasBG8ZgVw3Mt0lJ/9lKY8TCN04r33f9eI=;
        b=sFtkmEC/ZQDyY9JI1KQxnZ2lmJ5x0qK8XBLTRGyHQEM6PTKOtCQqZdmBg82jj+oj64
         z2My0M0lBD7RbkRq/GsHvGeFuW7jO70SndLo5IjNS4pymbbbaQM/s1Kw5brfw7pV5FHv
         bWkQ4ijvb+RRico0qxYHvPIsMe6gpA81nv7Vm058ZaPGotexdpmJw6UiHmQnbvhBbdKu
         gvw3m4KeXRwr6d3uRtiRzYPcNn/QLaj78doN8JODoGPuo8MEDqnPl9H1JGjsS5WnMCg5
         SIhnP8F36aKWOMLKmlloU3p7LqaL32BwQeYvdPGbLBtTcUy/95Hj2nDP3dGhFbo23aQO
         H4fw==
X-Gm-Message-State: AOAM531hzbGyz3FtoVVW8XU1fBDvURkYLmgSqjhdxAN5eWX5QN9hl0wR
	py6PVztrwSl9mwmd2kV5uhdjLBD6VuMtf5ipJEU=
X-Google-Smtp-Source: ABdhPJzW1nDYCzSpObohcEZEztGduH29KnXcefxPNVSjAdLvEjTi0MoAOfYTtRLWHu1YUcQ7M1S5mjDlQJR67yCnolM=
X-Received: by 2002:a37:9c17:: with SMTP id f23mr39917467qke.125.1622016196460;
 Wed, 26 May 2021 01:03:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org> <20210516223247.2401235-18-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210516223247.2401235-18-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 26 May 2021 01:02:50 -0700
Message-ID: <CAMKF1sqz=Mo6q5nA2sEDz0X2DydNaBJxd-=y1R_+7E_6hZsNrw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 18/27] zstd: upgrade 1.4.9 -> 1.5.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

this seems too break wireshark I think
https://errors.yoctoproject.org/Errors/Details/585545/

On Sun, May 16, 2021 at 3:33 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  ...-sort-all-wildcard-file-list-expansions.patch | 16 ++++++++--------
>  .../zstd/{zstd_1.4.9.bb => zstd_1.5.0.bb}        |  2 +-
>  2 files changed, 9 insertions(+), 9 deletions(-)
>  rename meta/recipes-extended/zstd/{zstd_1.4.9.bb => zstd_1.5.0.bb} (95%)
>
> diff --git a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
> index b5ffb95b713..37c5ff0cc06 100644
> --- a/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
> +++ b/meta/recipes-extended/zstd/zstd/0001-Makefile-sort-all-wildcard-file-list-expansions.patch
> @@ -1,4 +1,4 @@
> -From 986c7917aef632745cb3388a86a2f62347d5a0a5 Mon Sep 17 00:00:00 2001
> +From 77c7963c7a0f1c455f20520d5c7b1ec9b17a44fb Mon Sep 17 00:00:00 2001
>  From: Alexander Kanavin <alex.kanavin@gmail.com>
>  Date: Wed, 23 Dec 2020 19:14:32 +0100
>  Subject: [PATCH] Makefile: sort all wildcard file list expansions
> @@ -16,7 +16,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>   3 files changed, 8 insertions(+), 8 deletions(-)
>
>  diff --git a/programs/Makefile b/programs/Makefile
> -index 936f3c80..b8200fae 100644
> +index 599fb02f..2c416467 100644
>  --- a/programs/Makefile
>  +++ b/programs/Makefile
>  @@ -74,11 +74,11 @@ ZSTDLEGACY_DIR := $(ZSTDDIR)/legacy
> @@ -45,11 +45,11 @@ index 936f3c80..b8200fae 100644
>
>   ZSTD_ALL_SRC = $(ZSTDLIB_LOCAL_SRC) $(ZSTD_CLI_SRC)
>  diff --git a/tests/Makefile b/tests/Makefile
> -index f0605057..74a90b0f 100644
> +index 85553007..b71cdba8 100644
>  --- a/tests/Makefile
>  +++ b/tests/Makefile
> -@@ -49,7 +49,7 @@ ZSTD_FILES  := $(ZSTDDECOMP_FILES) $(ZSTDCOMMON_FILES) $(ZSTDCOMP_FILES)
> - ZBUFF_FILES := $(ZSTDDIR)/deprecated/*.c
> +@@ -49,7 +49,7 @@ ZSTDDECOMP_FILES := $(ZSTDDIR)/decompress/*.c
> + ZSTD_FILES  := $(ZSTDDECOMP_FILES) $(ZSTDCOMMON_FILES) $(ZSTDCOMP_FILES)
>   ZDICT_FILES := $(ZSTDDIR)/dictBuilder/*.c
>
>  -ZSTD_F1 := $(wildcard $(ZSTD_FILES))
> @@ -57,7 +57,7 @@ index f0605057..74a90b0f 100644
>   ZSTD_OBJ1 := $(subst $(ZSTDDIR)/common/,zstdm_,$(ZSTD_F1))
>   ZSTD_OBJ2 := $(subst $(ZSTDDIR)/compress/,zstdc_,$(ZSTD_OBJ1))
>   ZSTD_OBJ3 := $(subst $(ZSTDDIR)/decompress/,zstdd_,$(ZSTD_OBJ2))
> -@@ -211,7 +211,7 @@ bigdict: $(ZSTDMT_OBJECTS) $(PRGDIR)/datagen.c bigdict.c
> +@@ -202,7 +202,7 @@ bigdict: $(ZSTDMT_OBJECTS) $(PRGDIR)/datagen.c bigdict.c
>   invalidDictionaries : $(ZSTD_OBJECTS) invalidDictionaries.c
>
>   legacy : CPPFLAGS += -I$(ZSTDDIR)/legacy -DZSTD_LEGACY_SUPPORT=4
> @@ -67,10 +67,10 @@ index f0605057..74a90b0f 100644
>   decodecorpus : LDLIBS += -lm
>   decodecorpus : $(filter-out zstdc_zstd_compress.o, $(ZSTD_OBJECTS)) $(ZDICT_FILES) $(PRGDIR)/util.c $(PRGDIR)/timefn.c decodecorpus.c
>  diff --git a/tests/fuzz/Makefile b/tests/fuzz/Makefile
> -index f3a561de..68a29ef0 100644
> +index ccb574b7..b1cb2935 100644
>  --- a/tests/fuzz/Makefile
>  +++ b/tests/fuzz/Makefile
> -@@ -58,7 +58,7 @@ FUZZ_SRC       := \
> +@@ -62,7 +62,7 @@ FUZZ_SRC       := \
>         $(ZSTDCOMP_SRC) \
>         $(ZSTDDICT_SRC) \
>         $(ZSTDLEGACY_SRC)
> diff --git a/meta/recipes-extended/zstd/zstd_1.4.9.bb b/meta/recipes-extended/zstd/zstd_1.5.0.bb
> similarity index 95%
> rename from meta/recipes-extended/zstd/zstd_1.4.9.bb
> rename to meta/recipes-extended/zstd/zstd_1.5.0.bb
> index b86fdf8b2d5..9c950207431 100644
> --- a/meta/recipes-extended/zstd/zstd_1.4.9.bb
> +++ b/meta/recipes-extended/zstd/zstd_1.5.0.bb
> @@ -13,7 +13,7 @@ SRC_URI = "git://github.com/facebook/zstd.git;branch=release \
>             file://0001-Makefile-sort-all-wildcard-file-list-expansions.patch \
>             "
>
> -SRCREV = "e4558ffd1dc49399faf4ee5d85abed4386b4dcf5"
> +SRCREV = "a488ba114ec17ea1054b9057c26a046fc122b3b6"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>
>  S = "${WORKDIR}/git"
> --
> 2.30.2
>
>
> 
>
