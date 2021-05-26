Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web12.4511.1622016312619995327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 01:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NFPldOLh;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id eb9so291190qvb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 26 May 2021 01:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E4Th3TbjMbwMYlPJzzy4yCJLRHRB2gItp05FxkNEGP0=;
        b=NFPldOLhuYBIUk0VP0r+5YVXkRXlHcausZd3U60HRExHNwREGg4pkfe28SyZnPyESA
         q7Wmod/fGkHyxtPS18Gv8xkFnc11SJ0obd5AVGvzR5s48o1Knvwe89ZbhTsm/CqwUAag
         NJMWAd18JsCnWnqGkecfWRKkveV8f7VVS+JiEuV+QSlAyxN/L9JvEqUgwo9Ywu9/l2dS
         Yn4t2dM/q5sIkp4nqqdwv5ZGuwsO/kXnUaI9y/r2cyf48g7HtcS9Ps9lIEVjrZxtxaRg
         4ouZ7zINqbk6Ewer+TlfuOiPtLUjvm8C8WklvSkOSYH1tR1ijdJzfsxvFLjwHJNXTAk5
         Wg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E4Th3TbjMbwMYlPJzzy4yCJLRHRB2gItp05FxkNEGP0=;
        b=S4DMZ5mLbTalbwnj4rAYu3vnJCp4ZDH87irDY8J72fM2SEQFLv3oJlAG1ssZWWQuZ+
         pvAZVH7bSXzuTYAwgub0YC8Da735BnW9VUtUD+81QFWD5aHCIaOq/Cp5pqT7wPt2i3nv
         Wi04HPHTTX1LlNcXv8vdFyGiFCssRZBvw6yHMB1D20CbLBri5p4S77cuwpqZIdmxBsjG
         eJYXH0yIsGZAKBzOr9XnVnZU+ElCFKhEp+MJwPmx4XJsZG/vVHlwAKfSr7hSuyPgY3bC
         hUsLvbst3N+yU22GHQJIJeE+GDJ9QzK/JWAmK7VIDFsbzqRYiVMeMRmpHGEfXFsp85uD
         58vg==
X-Gm-Message-State: AOAM531ArkskQeMwNanieYpYMwxFfvKVITNDbjUIbElDwOvjzeZxTSfA
	RCSNBVDpx/eX4eDI2d+FpAtfhtouGuTKMkUCiwY=
X-Google-Smtp-Source: ABdhPJyFef7NIWQBX5427eTl9cN4U3zYRU/sIqMJ8NOasbuXu1lT/tYvExwtC77QQdg6jxAmXqClSYyov2u3CeohKXE=
X-Received: by 2002:ad4:4dc8:: with SMTP id cw8mr41124813qvb.16.1622016311809;
 Wed, 26 May 2021 01:05:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210525100447.3918978-1-samuli.piippo@qt.io>
In-Reply-To: <20210525100447.3918978-1-samuli.piippo@qt.io>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 26 May 2021 01:04:45 -0700
Message-ID: <CAMKF1srPhab+Vv=dKAoOMFCKmE2zLwAsJnZ6qAYt21nHJNss2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cmake-native: enabled zstd support
To: Samuli Piippo <samuli.piippo@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

i wonder if this is the cause of wireshark failure
https://errors.yoctoproject.org/Errors/Details/585545/

On Tue, May 25, 2021 at 3:05 AM Samuli Piippo <samuli.piippo@gmail.com> wrote:
>
> Now that zstd is in oe-core, enable support for it in native CMake.
>
> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> ---
>  meta/recipes-devtools/cmake/cmake-native_3.20.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
> index d91e42ef9a..335097d387 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
> @@ -1,7 +1,7 @@
>  require cmake.inc
>  inherit native
>
> -DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native ncurses-native"
> +DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native ncurses-native zstd-native"
>
>  SRC_URI += "file://OEToolchainConfig.cmake \
>              file://environment.d-cmake.sh \
> --
> 2.25.1
>
>
> 
>
