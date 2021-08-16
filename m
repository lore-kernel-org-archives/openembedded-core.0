Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.26167.1629128988292943871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 08:49:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RAvboMKw;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id e14so19543586qkg.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 08:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=egELumDdbwrFetCk6Q7KQJlgG4TPB5tmSQ+jld49OJc=;
        b=RAvboMKw7nI6i7TH4t+o4q+qjVg2RhwofX+Ra/rG8ct6MBS4jN37Rlm05wz3Xb8LSD
         S5BZzHbK9OntFFqudd5Vk4uJSdg6ypS5w4vEnkk9rZcI6Fq7t0tGyR/oyRCRyb3tFoQV
         5Dham3UEmNGvVF19nxCzedA+MizAk+9jlqbVjooELuEBzkNxj1IV2JQEo45HQzXg4So8
         oARsK2RahhdW6X8wPzq1j+bR7+K+xiXotvF1u/ZcP5zReiOHX9WVNGBSWBIvYxOJALVB
         3fXrcLbQrFhA1uoKuauOb+6KH+eqFurotSEauiq2myh91MJ0fhDCwzIMqf7SWsSlzGNN
         8/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=egELumDdbwrFetCk6Q7KQJlgG4TPB5tmSQ+jld49OJc=;
        b=P3pnCX380Rlt2XCeHnjeE3n5VxVDZfIby9Svh2rkeXwt60mirNknYNyOQs5lW+C5jZ
         OuzOHTxIUi0HPORSXf0twUb1Q/pRLRZlU1IeYKGBNiCap3okGbGNVjAtmYJzkW6Y5sTK
         VtWlosawQLkCYytia1ZoG1mOqewzWtBPUYgzbAiNvrXNq5/8BV1pgdax+2jNgrZT6YOr
         GUrO4U5YbJA2J/X9lUjfJZp906aWlgzHKJ3MfSWKNTeLZX1DAjkV5hCxcGQTb6M+TUg5
         VrM9SdCJzdTrApPxt7hrXc6K/jQx6Fg13E/uNQgpr5X7M3aGv1p8Qx+l52vf3lQ1CYV2
         r/2A==
X-Gm-Message-State: AOAM530KrSqLrzoMG3xzjY1UMptJWYGJOoQarGFPJIv5PkqRAKAS9dw0
	y1kVWrM56pm7NT85DOwkp3TKN5u3AlGhXvw0mmY=
X-Google-Smtp-Source: ABdhPJxI1v7yCMnnGUyHuiaqvz1p1AU6Hn/JuQwDiNgrPr6r395shY3c0xNJ0akCoo9MlOqiQybJImtONA0ADtOXzYk=
X-Received: by 2002:a05:620a:319a:: with SMTP id bi26mr2595286qkb.119.1629128987391;
 Mon, 16 Aug 2021 08:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210714134248.21366-1-JPEWhacker@gmail.com>
In-Reply-To: <20210714134248.21366-1-JPEWhacker@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 16 Aug 2021 08:49:21 -0700
Message-ID: <CAMKF1spUwc7ny7zzWJKWA2PyTg0UDASt=u0sWpcGbqa3S5361A@mail.gmail.com>
Subject: Re: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 14, 2021 at 6:42 AM Joshua Watt <JPEWhacker@gmail.com> wrote:
>
> Adds the command line compression tools which are needed by bitbake
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/conf/bitbake.conf | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f451ba6a47..3801db7d42 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -484,12 +484,12 @@ HOSTTOOLS += " \
>      [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
>      cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
>      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> -    head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo mknod \
> +    head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
>      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
> -    python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
> +    python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
>      sha1sum sha224sum sha256sum sha384sum sha512sum \
>      sleep sort split stat strings strip tail tar tee test touch tr true uname \
> -    uniq wc wget which xargs \
> +    uniq wc wget which xargs zstd \
>  "
>

this should also be reflecting on the distro prerequisites for
supported distros.

>  # Tools needed to run testimage runtime image testing
> --
> 2.32.0
>
>
> 
>
