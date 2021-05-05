Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web08.521.1620238072421201345
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 11:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dNUx900w;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id 1so1942788qtb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 11:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XaFBJ3NL/+hkGs385p/0dr+kcdcITmcd1TnBZItHnVg=;
        b=dNUx900wvjlb7wX9g2xGF+euJN3bebnGLkeN3PZusuWbL5ncJyKsew+qwl06nkDd5W
         ED/DlKYvr3OJzDOMPCmWEG8NatHne9e8fxHNlRIiF2qGfi59zf7xbLAciHvsLMpvtyc7
         aMFazRqbn17OL3XN8Ox56ZoNfPW9llVAlU0m0R39krhY/u/Jl39O6ycN9BHP0DZHByPD
         pQKf/7a12HMqXnXTcnWTmb1h8blfc1oVnuBxXw1lRIDQPC/tK9WyQa23XDFYVbrPgMUX
         Hddcj5EjdcY1R5qrK3IdidlwV55ZN4zUArFZQ7GfGbF0zV8Ge58F09zowAmqEy0xPeYv
         54og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XaFBJ3NL/+hkGs385p/0dr+kcdcITmcd1TnBZItHnVg=;
        b=X4lk+yPrydefRxRWOtZBL3NByZ4Gv0FRIvap7xP8QWlxWvQcAQMin771lLWHZJQDsn
         UP8uTXZgjDXZiFILRXFqKNItvl6yCi1yQss7xQwdU9kGFpELCshd0EBspkWw3EPfhOi/
         4Sf+y8yui30ojGVfsJx7diPeZZISfqWe7mp4ji58Jq7gpnWbv2KGBGlIkICuhwE+WlcO
         vK/KMtQ2Wa1+Uz66DNivXodFtyw8i5/hvRUrHFr1SIty3/sDSiHYn8y7yZTe2xPNNqul
         S+c+I0b7Hbj1WEZq6emZ1I/6DWp8ouGkcb85F3dLr5z3SrtEx4XQ9gdlb1lLwIbSMOZY
         li8w==
X-Gm-Message-State: AOAM530AyzO4z+lBhaqO8u9pQQdxxzYlWTLWtTAwcDb40u3EO6aH+xmU
	6qgfpCFQdI9a7OIUAsRDJY2e5Yw2HLF4CPFA2Jc=
X-Google-Smtp-Source: ABdhPJw3F61ZfioXUUCSfniPuxE5XjVFIj9Wlue9d6dpO4hneegzOCY/KhHimdOYuM3lDspMiqBNIZxrzBJzodHxqXk=
X-Received: by 2002:a05:622a:2c9:: with SMTP id a9mr28814887qtx.82.1620238071582;
 Wed, 05 May 2021 11:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210505151850.660512-1-alex.kanavin@gmail.com> <20210505151850.660512-50-alex.kanavin@gmail.com>
In-Reply-To: <20210505151850.660512-50-alex.kanavin@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 May 2021 11:07:25 -0700
Message-ID: <CAMKF1sqe2_HiA4VBArE0SSGF8fpNUTeZaHh23Uo6P6WJMJAhMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 50/61] python3-setuptools: upgrade 54.1.1 -> 56.0.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 5, 2021 at 8:20 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...0001-conditionally-do-not-fetch-code-by-easy_install.patch | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

change does not match the subject. Is something missing here ?

> diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
> index 680edbe704..5dd55f19a2 100644
> --- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
> +++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
> @@ -1,4 +1,4 @@
> -From 6380cc63f79abe8b8404c9be5ed5f213a70c8c6a Mon Sep 17 00:00:00 2001
> +From 552758405739be9ae220bbd158c2a1b7176fe292 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 17 Jul 2018 10:13:38 +0800
>  Subject: [PATCH] conditionally do not fetch code by easy_install
> @@ -15,7 +15,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   1 file changed, 5 insertions(+)
>
>  diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
> -index eeb21b5..eca1edd 100644
> +index 0917804..eed4a5a 100644
>  --- a/setuptools/command/easy_install.py
>  +++ b/setuptools/command/easy_install.py
>  @@ -636,6 +636,11 @@ class easy_install(Command):
> --
> 2.31.1
>
>
> 
>
